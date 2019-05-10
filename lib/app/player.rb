class Player
  attr_accessor :name, :player_num, :player_symbol
  @@player_count = 0
  @@symbol = ["X".colorize(:blue), "O".colorize(:red)] #array qui contient les deux symboles possibles

  def initialize
    @@player_count += 1
  end

  def create_player(player_name)
    @name = player_name #on assigne un nom à chaque instance de Player
    @player_num = @@player_count #un numéro (1 pour le premier joueur et 2 pour le deuxième)
    @player_symbol = @@symbol[@player_num-1]
  end


end
