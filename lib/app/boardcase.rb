class BoardCase
  attr_accessor :valeur, :name

  #lorque qu'on crée une bordcase 
  def initialize(name)
    @valeur = " " #on assigne à chaque boardcase une valeur par défaut (" ", la case est vide)
    @name = name #et un nom donné en paramètre lors d la création de l'instance
  end

end
