require './player'
require './question'

class Game
  attr_accessor :player1, :player2, :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end


  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end


  def new_turn
    question = Question.new
    puts "----- NEW TURN -----"
    puts "#{@current_player.name}: What does #{question.num1} plus #{question.num2} equal?"
    print "> "
    response = gets.chomp.to_i
    puts "\n"

    if response == question.answer
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriosly? No!"
      @current_player.lives -= 1
    end

    puts "--- P1: #{@player1.lives}/3  vs  P2: #{@player2.lives}/3 ---"
    puts "\n"
    puts "\n"
    switch_players
  end


  def game_over
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3!"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end


  def play_game
    new_turn until @player1.lives == 0 || @player2.lives == 0
    game_over
  end
end
