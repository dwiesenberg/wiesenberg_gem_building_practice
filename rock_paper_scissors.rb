# Gem Building Practice: Rock Paper Scissors

module RockPaperScissors

  require 'io/console'

  class Game

    def play
      welcome
      enter_names
      loop do
        loop do
          choose_handshapes
          render_choices
          break if winner_found?
        end
        declare_winner
        break unless another_game?
      end
    end

    def welcome

      print %{

  WELCOME TO ROCK-PAPER-SCISSORS!

  Rules:
  1. Choose whether to play against a friend or the computer.
  2. Each human player chooses a handshape. The computer chooses one 
     at random.
  3. When both players choose the same hand shape, it is a draw. Go 
     back to step 2.
  4. When the hand shapes are different, a winner is chosen as follows:
     (a) Rock and scissors: rock wins
     (b) Paper and rock: paper wins
     (c) scissors and paper: scissors win           
             }

    end # welcome

    def enter_names
      print "\n Are you playing against the computer (Y or N)? "
      until %w(Y N).include? (answer = gets.chomp)
        print " Incorrect answer - try again: "
      end
      puts
      @player_1 = Human.new(enter_name("First"))
      @player_2 = Computer.new("Computer") if answer == "Y"
      @player_2 = Human.new(enter_name("Next")) if answer == "N"
    end

    def enter_name(player_number)
      print " #{player_number.ljust(5, padstr = " ")} player, please enter your name: "
      while "" == (name = gets.chomp)
        print " Incorrect answer - try again: "
      end
      name
    end

    def choose_handshapes
      [@player_1, @player_2].each { |player| player.choose_handshape}
    end

    def render_choices
      puts "\n #{"Name".ljust(12, padstr = " ")}#{(" " * 5)}Handshape"
      puts " #{("-" * 12) + (" " * 5) + ("-" * 9)}"
      [@player_1, @player_2].each { |player| puts " #{(player.name.ljust(12, padstr = " ")) + (" " * 5) + player.handshape.to_s.capitalize}" }
    end

    def winner_found?
      case @player_1.handshape
      when @player_2.handshape
        puts "\n Draw - choose again\n"
        return false
      when :rock
        @player_2.handshape == :scissors ? winner_1 : winner_2
      when :paper
        @player_2.handshape == :rock ? winner_1 : winner_2
      when :scissors
        @player_2.handshape == :paper ? winner_1 : winner_2
      end
      true
    end

    def winner_1
      @winner = @player_1.name
    end

    def winner_2
      @winner = @player_2.name
    end

    def declare_winner
      print "\n Winner is #{@winner}. "
      puts "Congratulations!" if @winner != "Computer"
      puts "Bad luck!" if @winner == "Computer"
    end

    def another_game?
      print "\n Another game (Y or N)? "
      until %w(Y N).include? (answer = gets.chomp)
        print "Incorrect answer - try again: "
      end
      return true if answer == "Y"
      puts "\n Thanks for playing. Goodbye!\n\n"
      false
    end

  end # class Game

  class Player

    def initialize(name)
      @name = name
    end

    attr_reader :name, :handshape

  end # class Player

  class Human < Player

    def choose_handshape
      puts "\n #{@name}, choose your handshape - Rock, Paper, Scissors (R, P or S)."
      print " (Your answer will not be shown to keep it secret from your opponent.): "
      until %w(R P S).include? (answer = STDIN.noecho(&:gets).chomp)
        print " Incorrect answer - try again: "
      end
      puts
      case answer
      when "R"
        @handshape = :rock
      when "P"
        @handshape = :paper
      when "S"
        @handshape = :scissors
      end
      @handshape
    end

  end # class Human

  class Computer < Player

    def choose_handshape
      puts "\n Computer is choosing ..."
      sleep(0.5)
      @handshape = [:rock, :paper, :scissors].sample
    end

  end # end class Computer

end # module RockPaperScissors


RockPaperScissors::Game.new.play


