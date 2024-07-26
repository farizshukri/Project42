// backend/models/Template.js
const mongoose = require('mongoose');

const TemplateSchema = new mongoose.Schema({
    name: { type: String, required: true },
    filePath: { type: String, required: true }
});

module.exports = mongoose.model('Template', TemplateSchema);
