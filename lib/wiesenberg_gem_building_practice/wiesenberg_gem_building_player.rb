
# module WiesenbergGemBuildingPractice
# Gem Building Practice: Rock Paper Scissors

  module RockPaperScissors

    require 'io/console' # not require_relative (I believe) -- needs explaining

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

# end # module WiesenbergGemBuildingPractice


