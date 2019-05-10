require_relative 'game'

class Application

  def initialize
    new_game
  end

  def new_game
    #infinite loop to launch a game
    while true 
    system "clear"
    @game = Game.new
    end
  end

end
