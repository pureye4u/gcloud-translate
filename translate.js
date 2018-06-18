'use strict';

module.exports = {
    translate: (text, target, callback, error) => {
        console.log('translate', text, target);
        const Translate = require('@google-cloud/translate');
        const translate = new Translate();
        translate.translate(text, target).then(results => {
            let translations = results[0];
            translations = Array.isArray(translations)
                ? translations
                : [translations];

            callback(translations);
            // console.log('Translations:');
            // translations.forEach((translation, i) => {
            //     console.log(`${text[i]} => (${target}) ${translation}`);
            // });
        })
        .catch(err => {
            error(err);
            // console.error('ERROR:', err);
        });
    }
}
