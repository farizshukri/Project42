import UIKit

struct Recipe {
    let title: String
    let instructions: String
    let imageName: String
}

class ViewController: UIViewController {
    
    let recipes = [
        Recipe(title: "Spaghetti Carbonara",
               instructions: "Cook spaghetti. Mix eggs, cheese, and bacon. Combine.",
               imageName: "spaghetti_carbonara"),
        Recipe(title: "Caprese Salad",
               instructions: "Slice tomatoes and mozzarella. Arrange with basil leaves. Drizzle with olive oil and balsamic vinegar.",
               imageName: "caprese_salad"),
        Recipe(title: "Chocolate Chip Cookies",
               instructions: "Mix butter, sugar, and eggs. Add flour and chocolate chips. Bake.",
               imageName: "chocolate_chip_cookies")
    ]
    
    let tableView = UITableView()
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        title = "Recipes"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = recipes[indexPath.row]
        let detailVC = DetailViewController(recipe: selectedRecipe)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

class DetailViewController: UIViewController {
    
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 200))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: recipe.imageName)
        view.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: imageView.frame.maxY + 20, width: view.frame.width - 40, height: 30))
        titleLabel.text = recipe.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        let instructionsLabel = UILabel(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 20, width: view.frame.width - 40, height: 200))
        instructionsLabel.text = recipe.instructions
        instructionsLabel.numberOfLines = 0
        instructionsLabel.font = UIFont.systemFont(ofSize: 16)
        instructionsLabel.textAlignment = .left
        view.addSubview(instructionsLabel)
    }
}
