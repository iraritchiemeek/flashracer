require_relative 'view'
require_relative 'model'
class GameController
attr_reader :view, :game
  def initialize(game_model, game_view)
    @game = game_model
    @view = game_view
  end

  def start
    game.racer.create_board
    view.initialize_game_render
    player_names = view.enter_names_render
    game.add_player_names(player_names)

    players = game.players
    view.render_player_names(player_names)
      i = 0
      until game.game_finished?
        index = i % 2
        process_card(index, players)
        i += 1
      end

    view.render_winner(game.winner.player_name)

  end

  #LOGIC
    # render name of players
   # view.render_score(game.get_player(0))
    # say which player is playing
    # while winner is nil?
      # ask game players array
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
  def process_card(index, players)
    view.render_track(game.racer.board)

    view.display_player(players[index].player_name)
    card = game.get_current_card
    view.render_question(card.question)
    input = view.get_answer
    if card.compare(input)
      view.render_correct_answer
      game.update_score(index)
      game.racer.advance_player(index)
    else
      view.render_wrong_answer(card.answer)
    end
    view.render_score(players[index].player_score)
  end



end

# Create the game
my_game = FlashModel.new
# Create the view
my_view = View.new

my_controller  = GameController.new(my_game, my_view)

my_controller.start
