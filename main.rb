class Player
  attr_accessor :points
  def initialize
    @points = 3
  end
end

class Turn
  attr_reader :num1, :num2, :operator, :current_user
  def initialize (current_user,other_user)
    @current_user = current_user
    @other_user = other_user
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    operators = [:+, :-, :*, :/]
    @operator = operators.sample
    @answer = num1.send(operator, num2)
  end

  def display_question
    if operator.to_s == "+"
      word_op = "plus"
    elsif operator.to_s == "-"
      word_op = "minus"
    elsif operator.to_s == "/"
      word_op = "divided by"
    elsif operator.to_s == "*"
      word_op = "times"
    end
    puts @current_user.to_s + ": What does " + @num1.to_s + " " + word_op.to_s + " " + @num2.to_s + " equal?"
  end

  def check_answer
    # get user input and compare with answer that's been initialized
    # output the correct thing
    puts @answer.to_s
    input = gets.chomp
    @current_user.points -= 1 unless input == @answer.to_s

  end

end

class Game
  attr_accessor :current_user
  def initialize player1, player2
    @current_user= player1
    @other_user = player2
  end

  def game_turn player1, player2
    turn = Turn.new @current_user, @other_user
    turn.display_question
    turn.check_answer
    if current_user == player1
      @current_user = player2
      @other_user = player1
    else
      @current_user = player2
      @other_user = player1
    end
  end
end



player1 = Player.new
player2 = Player.new
game = Game.new player1, player2
while (player1.points > 0) && (player2.points > 0)
  game.game_turn player1,player2
  puts "-----NEW TURN -----" unless (player1.points == 0) || (player2.points == 0)
  if (player1.points == 0) || (player2.points == 0)
    puts "----- GAME OVER -----"
  end
end
