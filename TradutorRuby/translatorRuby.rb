# Gems e bibliotecas necessárias para o funcionamento do código (Gems presentes no Gemfile)
require "httparty"
require "json"
require "uri"
require "io/console"

class Translator # Classe do tradutor onde ficam armazenados as funções do tradutor

  # Função principal do tradutor responsável por fazer a tradução utilizando a gem httparty junto com mymemory
  def translate(text, original_lan, translated_lan)
    # Declarando uma váriavel que capta a hora atual do sistema para colocar como título no txt
    time = Time.now
    # Conversão para string com strftime
    time = time.strftime("translatedText_%d-%m-%y_%H%M.txt")

    # Monta a URL da API MyMemory
    url = "https://api.mymemory.translated.net/get?q=#{URI.encode_www_form_component(text)}&langpair=#{original_lan}|#{translated_lan}"

    # Faz a requisição GET
    response = HTTParty.get(url)

    # Converte o corpo da resposta em JSON
    result = JSON.parse(response.body)

    # Pega o texto traduzido
    translation = result.dig("responseData", "translatedText")

    # Mostra o resultado
    puts "\n\nTradução: #{translation}"

    # Salva a tradução em um arquivo txt
    File.open(time, "w") do |line|
      line.puts "Texto original: "
      line.puts text
      line.puts "\n"
      line.puts "Texto traduzido: "
      line.puts translation
    end
  end

  # Função que mostra a tabela de línguas e sua abreviações
  def show_lan
    languages = {
      "af" => "Afrikaans",
      "sq" => "Albanês",
      "de" => "Alemão",
      "am" => "Amárico",
      "ar" => "Árabe",
      "hy" => "Armênio",
      "az" => "Azerbaijano",
      "bn" => "Bengalês",
      "bs" => "Bósnio",
      "bg" => "Búlgaro",
      "ca" => "Catalão",
      "zh" => "Chinês",
      "ko" => "Coreano",
      "da" => "Dinamarquês",
      "es" => "Espanhol",
      "et" => "Estoniano",
      "fi" => "Finlandês",
      "fr" => "Francês",
      "el" => "Grego",
      "hi" => "Hindi",
      "nl" => "Holandês",
      "hu" => "Húngaro",
      "id" => "Indonésio",
      "en" => "Inglês",
      "it" => "Italiano",
      "ja" => "Japonês",
      "ms" => "Malaio",
      "pl" => "Polonês",
      "pt" => "Português",
      "ro" => "Romeno",
      "ru" => "Russo",
      "sv" => "Sueco",
      "tr" => "Turco",
      "uk" => "Ucraniano",
      "vi" => "Vietnamita",
      "zu" => "Zulu",
    }

    puts "\nIdiomas disponíveis:"
    languages.each { |code_lan, name_lan| puts "#{code_lan} → #{name_lan}" }
    puts "-----------------------------------------"
  end
end

# Classe de controle que armazena funções gerais
class Control
  # Função que espera o usuário apertar enter para continuar
  def continue
    puts "\n\nAperte enter para continuar"
    enter = gets.chomp
  end

  # Função que limita a entrada de dados na hora de infornar a lingua
  def limit_input
    input = ""
    while (char = STDIN.getch) != "\r" # "\r" é Enter
      break if char == "\u0003"         # Ctrl+C pra sair

      # Configuração do backspace
      if char == "\b" && !input.empty? # Se o backspace for apertado e o input não estiver vazio
        input.chop! # Backspace input
        print "\b \b" # Print backspace para exibir o backspace no console
        next
      end

      # Configurando limite de carcteres
      next if input.length >= 2 # Se o tamanho do input for maior ou igual a 2
      print char # Imprime caractere pressionado
      input << char # Passa o valor de char para input
    end
    return input
  end
end

# Classe utilizada para organizar os loops a fim de fazer o programa rodar desde o começo até o fim em loop até que o usuário selecione -1
class MainCode
  @option = 0

  # Função de inicialização
  def initialize
    @translator = Translator.new # Inicia a classe tradutor
    @control = Control.new # Inicia a classe controle
  end

  # Função que armazena o menu inicial e o parte onde informamos o texto a ser traduzido roda até que o usuário selcione 2 ou -1
  def text_loop
    until @option == -1
      # Mensagem inicial do progrma fornece as opções de consultar manual e rodar tradutor e finalizar o programa
      puts "\nBem vindo ao tradutor de texto! \n\n 1 - Manual de instruções - Recomendado para primeiro uso\n 2 - Rodar tradutor \n-1 - Finalizar programa.\n"
      print "\nQual opção deseja realizar?: "
      @option = gets.chomp.to_i

      # Se 1 imprime o manual de instruções
      if @option == 1
        puts "\n\nVocê pode finalizar o programa em qualquer pergunta de qual opção deseja realizar informando -1"
        puts "\nEste programa recebe o texto que for inserido pelo usuário \ne traduz mostrando o resultado e o texto original \nem um arquivo .txt"
        puts "\nO tradutor funciona assim como o do google, \nvocê seleciona a lingua do seu texto para ser \ntraduzido para a lingua que você seleciona. \n\nPorém neste é necessário inserir uma abreviação \ndo nome da lingua para que o tradutor reconheça a lingua selecionada\n"
        @translator.show_lan
        @control.continue

        # Se 2 informa o texto a ser traduzido e termina este loop
      elsif @option == 2
        puts "\nInforme o texto que deseja traduzir:"
        @text = gets.chomp
        break

        # Se -1 informa a mensagem de finalização
      elsif @option == -1
        puts "\nFinalizando o programa"

        # Se não opção inválida
      else
        puts "\nOpção inválida"
        @control.continue
      end
    end
  end

  # Função que armazena o loop para informar a linguagem original do texto
  def original_lan_loop
    until @option == -1
      puts "\n\nAgora é necessário informar a abreviação da lingua. O que deseja fazer?: \n\n1 - Ver abreviações \n2 - Informar linguagem"
      print "\nQual opção deseja realizar?: "
      @option = gets.chomp.to_i

      # Se 1 mostra lista de linguagens
      if @option == 1
        @translator.show_lan
        @control.continue

        # Se 2 informa a linguagem original do texto e termina este loop
      elsif @option == 2
        puts "\nInforme a linguagem original do texto:"
        @original_lan = @control.limit_input
        break

        # Se -1 informa a mensagem de finalização
      elsif @option == -1
        puts "\nFinalizando o programa"

        # Se não opção inválida
      else
        puts "\nOpção inválida"
      end
    end
  end

  # Função que armazena o loop para informar a linguagem que o texto vai ser traduzido
  def translated_lan_loop
    until @option == -1
      puts "\n\nAgora é necessário informar a abreviação da lingua que o texto vai ser traduzido. O que deseja fazer?: \n\n1 - Ver abreviações \n2 - Informar linguagem"
      print "\nQual opção deseja realizar?: "
      @option = gets.chomp.to_i

      # Se 1 mostra lista de linguagens
      if @option == 1
        @translator.show_lan
        @control.continue

        # Se 2 informa a linguagem a ser traduzido e termina este loop voltando pro inicial
      elsif @option == 2
        puts "\nInforme a linguagem que o texto será traduzido"
        @translated_lan = @control.limit_input
        @translator.translate(@text, @original_lan, @translated_lan)
        @control.continue
        @option = 0
        break  # <-- volta pro menu principal

        # Se -1 informa a mensagem de finalização
      elsif @option == -1
        puts "\nFinalizando o programa"

        # Se não opção inválida
      else
        puts "\nOpção inválida"
      end
    end
  end

  # Função que roda o código na ordem correta
  def run
    loop do
      text_loop
      break if @option == -1

      original_lan_loop
      break if @option == -1

      translated_lan_loop
      break if @option == -1
    end
  end
end

# Inicia a classe Main_code
main_code = MainCode.new

# Chamada da função run (Coloca o código pra funcionar)
main_code.run
