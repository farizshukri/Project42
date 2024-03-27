// frontend/script.js

document.addEventListener('DOMContentLoaded', () => {
    const templatesList = document.getElementById('templates');

    // Fetch and display templates
    function fetchTemplates() {
        fetch('http://localhost:5000/api/templates')
            .then(response => response.json())
            .then(templates => {
                templatesList.innerHTML = '';
                templates.forEach(template => {
                    const li = document.createElement('li');
                    li.innerHTML = `<a href="http://localhost:5000/api/templates/download/${template.filePath}" download>${template.name}</a>`;
                    templatesList.appendChild(li);
                });
            })
            .catch(error => console.error('Error fetching templates:', error));
    }

    fetchTemplates();
});
