class Juego
  attr_accessor :deck

  def initialize
   myController = MyController.new 
    puts "Ingresa tu nombre"
   
    puts "Bienvenido   Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
    puts ""
    puts ""
    myController.main
    puts ""
    puts "Felicitaciones! Has finalizado."
  end
end

class MyController
  def main 
    deck = GameData.new.getDataQuestions
    deck.each {|key,value|
      puts "Definicion: "+key
      answer = gets.chomp
      val = value.chomp
      while(answer.casecmp(val) != 0 ) do
        puts "Incorrecto!, Trata de nuevo"
        answer = gets.chomp
      end
      puts "Correcto!"
      puts ""
    }
  end
end

class GameData
  def getDataQuestions
    deck = Hash.new
    text_file="preguntas.txt"
    deck= File.foreach(text_file).map {|line| line.strip }.delete_if { |line| line == ""}
    deck = Hash[*deck]
  end
end

myController = Juego.new
