import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
}

struct ContentView: View {
    @State private var expenses = [ExpenseItem]()
    @State private var title = ""
    @State private var amount = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("$\(item.amount)")
                            }
                            Spacer()
                        }
                    }
                    .onDelete(perform: removeExpense)
                }
                .navigationBarTitle("Expense Tracker")
                .navigationBarItems(trailing:
                    Button(action: {
                        // Add expense action
                        let amount = Double(self.amount) ?? 0
                        let expense = ExpenseItem(title: self.title, amount: amount)
                        self.expenses.append(expense)
                        self.title = ""
                        self.amount = ""
                    }) {
                        Image(systemName: "plus")
                    }
                )

                Form {
                    TextField("Enter expense title", text: $title)
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                .padding()

                Spacer()
            }
        }
    }

    func removeExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
