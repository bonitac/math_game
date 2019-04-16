class Game
  attr_accessor :current_user, :other_user
  def initialize
    @current_user= Player.new (1)
    @other_user = Player.new (2)
  end

  def game_turn
    turn = Turn.new @current_user, @other_user
    turn.display_question
    turn.check_answer
    tmp = @current_user
    @current_user = @other_user
    @other_user = tmp
  end
end