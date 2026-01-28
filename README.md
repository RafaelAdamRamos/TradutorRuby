# Ruby Translator

The **Ruby Translator** uses the **HTTParty** gem together with the **MyMemory Translated API** to perform a simple translator.  
At the end, the translation is saved into a `.txt` file with the date and time of the translation.  
This project was developed as an initial exercise for my Ruby studies.

---

## Languages and libraries used
- **Ruby** (main language)
- **HTTParty** (HTTP requests)
- **JSON** (data formatting and manipulation)
- **URI** (URL handling)

---

## Installation and Execution
1. **Clone the repository**
```bash
   git clone https://github.com/RafaelAdamRamos/TradutorRuby.git
   cd TradutorRuby
```

2. **Run Bundler**
```
 cd project
 bundle install
```
3. **Run the project**
```
 cd ..
 ruby translatorRuby.rb
```

---

## Instruction manual - (Present in the code)
You can end the program at any prompt asking which option you want to perform by entering -1.

This program receives the text entered by the user and translates it, showing the result and the original text in a txt file.

The translator works similarly to Google Translate: you select the language of your text to be translated into the language you choose. However, in this program it is necessary to enter an abbreviation of the language name so the translator can recognize the selected language.

    Available languages:
    af → Afrikaans
    sq → Albanian
    de → German
    am → Amharic
    ar → Arabic
    hy → Armenian
    az → Azerbaijani
    bn → Bengali
    bs → Bosnian
    bg → Bulgarian
    ca → Catalan
    zh → Chinese
    ko → Korean
    da → Danish
    es → Spanish
    et → Estonian
    fi → Finnish
    fr → French
    el → Greek
    hi → Hindi
    nl → Dutch
    hu → Hungarian
    id → Indonesian
    en → English
    it → Italian
    ja → Japanese
    ms → Malay
    pl → Polish
    pt → Portuguese
    ro → Romanian
    ru → Russian
    sv → Swedish
    tr → Turkish
    uk → Ukrainian
    vi → Vietnamese
    zu → Zulu

## Folder Structure
TRADUTORRUBY/
 ├── project/
 │    ├── Gemfile
 │    └── Gemfile.lock
 ├── README.md
 └── translatorRuby.rb

## Contribution
Feel free to open issues or submit pull requests!

## License
This project is licensed under the MIT License.
