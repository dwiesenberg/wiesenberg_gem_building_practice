require 'wiesenberg_gem_building_practice/version'
require 'wiesenberg_gem_building_practice/game'
require 'wiesenberg_gem_building_practice/player'

module WiesenbergGemBuildingPractice
# Gem Building Practice: Rock Paper Scissors

  include RockPaperScissors

end # module WiesenbergGemBuildingPractice


WiesenbergGemBuildingPractice::RockPaperScissors::Game.new.play

