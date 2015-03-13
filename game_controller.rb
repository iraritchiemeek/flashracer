require_relative 'view'
require_relative 'model'
class GameController
attr_reader :view, :model
  def initialize(game_model, game_view)
    @game = game_model
    @view = game_view
  end

  def start

    view.initialize_game_render
    player_names = view.enter_names_render
    model.add_player_names(player_names)
    # render name of players
    players = model.players
    view.render_player_names(player_names)
    # view.render_score(model.get_player(0))
    # say which player is playing
    # while winner is nil?
          view.render_track
          card = model.get_current_card
          view.render_question(card.question)
          input = view.get_answer
          if card.compare(input)
            view.render_correct_answer
            model.update_score(index)
          else
            view.render_wrong_answer(card.answer)
          end

      # ask model players array
      # ask view to print the of the player! (players[0].name)
    # print question
      #ask Flashcards for a deck
           # ask view to dislay question
    # get user input for answer
    # checking if answer is right
      # if right display "RIGHT" and score and racer moves
      # if wrong display "WRONG" and display right answer
    # Switch player
    # Repeat from 16 to 22 until one of the racer reaches the end of the line or the no more questions left

  end

end

# Create the model
my_game = FlashModel.new
# Create the view
my_view = View.new

my_controller  = GameController.new(my_game, my_view)

my_controller.start
