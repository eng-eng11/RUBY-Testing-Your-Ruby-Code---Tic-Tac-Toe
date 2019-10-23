require './game.rb'

game = Game.new()
game.switch_player
game.populate_display
until game.over?
  game.switch_player
  game.play_turn
  game.populate_display
end
