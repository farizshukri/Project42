// backend/routes/templates.js
const express = require('express');
const router = express.Router();
const Template = require('../models/Template');
const path = require('path');
const fs = require('fs');

// Get all templates
router.get('/', async (req, res) => {
    try {
        const templates = await Template.find();
        res.json(templates);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Download a template
router.get('/download/:fileName', (req, res) => {
    const { fileName } = req.params;
    const filePath = path.join(__dirname, '../templates', fileName);
    if (fs.existsSync(filePath)) {
        res.download(filePath);
    } else {
        res.status(404).json({ error: 'File not found' });
    }
});

module.exports = router;
