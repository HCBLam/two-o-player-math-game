require '.player'
require '.question'

class Game
  attr_accessor :player1, :player2, :current_player

  def initialize(name)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = @player1
  end




