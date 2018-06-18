'use strict';

const express = require('express');
const translate = require('./translate.js');
const app = express();

app.get('/translate/:lang/:text', (req, res) => {
    const lang = req.params.lang;
    const text = req.params.text;
    console.log(translate);
    translate.translate(text, lang, (results) => {
        res.json({ success: true, lang: lang, text: text, results: results });
    }, (err) => {
        res.json({ success: false, lang: lang, text: text, error: err });
    });
});

app.listen(3000, () => {
    console.log('App listening on port 3000!');
});
