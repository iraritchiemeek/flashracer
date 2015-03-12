class GameController

  def initialize(game_model, game_view)
    @game = game_model
    @view = game_view
  end

end

# Create the model
my_game = ""
# Create the view
my_view = ""

my_controller  = GameController.new(my_game, my_view)
