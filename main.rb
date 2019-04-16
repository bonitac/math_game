require './player'
require './turn'
require './game'

game = Game.new
player1 = game.current_user
player2 = game.other_user
while (player1.points > 0) && (player2.points > 0)
  game.game_turn
  puts "-----NEW TURN -----" unless (player1.points == 0) || (player2.points == 0)
  if (player1.points == 0) || (player2.points == 0)
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
