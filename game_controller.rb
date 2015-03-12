require_relative 'view'
class GameController

  def initialize(game_model, game_view)
    @game = game_model
    @view = game_view
  end

  def start

    # initialize game
    # get user input for the player 1
    # get user input for the player 2
    # render name of players
    # render score of players
    # say which player is playing
    # print question
    # get user input for answer
    # checking if answer is right
      # if right display "RIGHT" and score and racer moves
      # if wrong display "WRONG" and display right answer
    # Switch player
    # Repeat from 16 to 22 until one of the racer reaches the end of the line or the no more questions left

  end

end

# Create the model
my_game = ""
# Create the view
my_view = View.new

my_controller  = GameController.new(my_game, my_view)
