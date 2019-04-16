class Turn
  attr_reader :num1, :num2, :operator, :current_user, :other_user
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
    puts "Player #{current_user.num}: What does #{num1} #{word_op} #{num2} equal?"
  end

  def check_answer
    puts @answer.to_s
    input = gets.chomp
    if input == @answer.to_s
      puts "Player " + @current_user.num.to_s + ": YES! You are correct."
    else
      @current_user.points -= 1
    end
    puts "P#{current_user.num}: #{current_user.points}/3 vs P#{other_user.num}: #{other_user.points}/3"
  end
end