# Tradutor Ruby
O **Tradutor Ruby** utiliza a gem **HTTParty** junto com a API **MyMemory Translated** para executar um tradutor simples.  
Ao final, a tradução é salva em um arquivo `.txt` com a data e o horário da tradução.  
Este projeto foi desenvolvido como um exercício inicial para meus estudos em Ruby.

---

## Linguagens e bibiotecas utilizadas
- **Ruby** (linguagem principal)
- **HTTParty** (requisições HTTP)
- **JSON** (formatação e manipulação de dados)
- **URI** (tratamento de URLs)

---

## Instalação e Execução
1. **Clone o repositório**
   ```bash
   git clone https://github.com/seuusuario/tradutor-ruby.git
   cd TradutorRuby

2. **Rode o Bundler**
    cd project
    bundle install

3. **Rode o projeto**
    cd ..
    ruby translatorRuby.rb

---

## Manual de instruções - (Presente no código)

Você pode finalizar o programa em qualquer pergunta de qual opção deseja realizar informando -1

Este programa recebe o texto que for inserido pelo usuário e traduz mostrando o resultado e o texto original em um arquivo txt

O tradutor funciona assim como o do google, você seleciona a lingua do seu texto para ser traduzido para a lingua que você seleciona. Porém neste é necessário inserir uma abreviação do nome da lingua para que o tradutor reconheça a lingua selecionada

    Idiomas disponíveis:
    af → Afrikaans
    sq → Albanês
    de → Alemão
    am → Amárico
    ar → Árabe
    hy → Armênio
    az → Azerbaijano
    bn → Bengalês
    bs → Bósnio
    bg → Búlgaro
    ca → Catalão
    zh → Chinês
    ko → Coreano
    da → Dinamarquês
    es → Espanhol
    et → Estoniano
    fi → Finlandês
    fr → Francês
    el → Grego
    hi → Hindi
    nl → Holandês
    hu → Húngaro
    id → Indonésio
    en → Inglês
    it → Italiano
    ja → Japonês
    ms → Malaio
    pl → Polonês
    pt → Português
    ro → Romeno
    ru → Russo
    sv → Sueco
    tr → Turco
    uk → Ucraniano
    vi → Vietnamita
    zu → Zulu

## Estrutura de Pastas
TRADUTORRUBY/
 ├── project/
 │    ├── Gemfile
 │    └── Gemfile.lock
 ├── README.md
 └── translatorRuby.rb

## Contribuição
Sinta-se à vontade para abrir issues ou enviar pull requests!

## Licença
Este projeto está sob a licença MIT.
