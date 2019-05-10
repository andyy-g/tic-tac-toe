require_relative 'player'
require_relative 'board'
require_relative 'boardcase'

class Game
  attr_accessor :arr_player, :case_choice, :player_1, :player_2
  @@game_number = 0
  @@play1_wins = 0
  @@play2_wins = 0
  def initialize
    create_player
    @board = Board.new
    @statut_partie = "new"
    @winner = 0
    @show = Show.new
    turn
  end

  #la méthode crée deux instances de Player et les mets dans un array  
  def create_player
      puts "Quel est le nom du joueur 1 ?".colorize(:blue)
      player_name = gets.chomp.to_s.colorize(:blue)
      @player_1 = Player.new
      @player_1.create_player(player_name)
    
      puts " ", "Quel est le nom du joueur 2 ?".colorize(:red)
      player_name = gets.chomp.to_s.colorize(:red)
      @player_2 = Player.new
      @player_2.create_player(player_name)

      @arr_player = [@player_1, @player_2]
  end



  def turn
    @@game_number += 1
    tour = 1
    @show.show_board(@board) #on affiche la grille avec Show
    puts " ", "La partie #{@@game_number} commence, youhou !!"
    while tour <= 9 #la boucle permet d'arrêter la partie après 9 tours (quand la grille est complète
      i = tour % 2 #i prend successivement la valeur 1 ou 0 et sert d'index pour l'arrêt arr_player qui contient les deux joueurs
      puts " " 
      print "Partie #{@@game_number} - Tour ##{tour} : "
      #on envoie le bon joueur à la methode playturn
      #on lance un tour avec la methode playturn en indiquant quel joueur joue en paramètre
      @board.play_turn(arr_player[i])

      #on affiche le plateau
      @show.show_board(@board)

      #à la fin du tour on vérifie si l'un des joueurs a gagné avec la méthode check_if_winet si il y a victoire on sort de la boucle while (avec break) et on affiche le vainqueur
      if @board.check_if_win == true
        # @winner = arr_player[i]["name"]
        i == 0 ? @@play1_wins =+1 : @@play2_wins += 1 
        i == 0 ? @winner = @player_1.name : @winner = player_2.name
        puts " ", "Partie terminée, et c'est #{@winner} qui gagne, en #{tour} tours !!", " "
        break
      elsif tour == 9 # si on arrive au nevième tour on dit aux joueurs qu'il y a match nul
        puts " ", "Partie terminée, bouh c'est un match nuuuuul !", " "
        break
      end

      tour += 1 
    end

    new_round #quand la partie est terminé on propose aux joueurs de relancer une partie avec la méthode new_round

  end



  def new_round
    answer = prompt_end_choice

    if answer == "OUI" #si les joueurs veulent refaire une partie:
      @board = Board.new #on réinitialise le grille
      @show = Show.new #et on l'affiche 
      turn
    else
      puts " ", "Merci, c'était cool"
      game_end #si les joueurs ne veulent pas on ferme le programme avec game_end
    end
  end


def game_end
  #end case with count of the wins per player
  puts "Ha, et juste pour rappel le jeu vient de se terminer après #{@@game_number} parties sur le score de :", " "
  print "#{@player_1.name} : #{@@play1_wins}".colorize(:blue)
  print " - "
  puts "#{@player_2.name} : #{@@play2_wins}".colorize(:red)
  puts " "
 exit! #permet de quitter le programme
end


  #méthode réalisé avec la gem tty_prompt pour faire un menu de selection chiadé 
  def prompt_end_choice
    prompt = TTY::Prompt.new
    choices = ["OUI", "NON"]
    answer = prompt.select('Voulez-vous lancer une nouvelle partie ?', choices, help: '(Utilise les flèches pour choisir ta réponse et appuie sur Entrée)')
    return answer
  end


end
