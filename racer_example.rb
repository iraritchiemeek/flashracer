# print board (Nested array with a length of 30)
# print an empty board with pipes and spaces
# put player 'a' at start of board (index[0])
# roll dice (method that calls random number that realates to index)
# move player 'a' according to roll number. Replace array element "  |" with " a |"

require 'pp'

 require_relative 'racer_utils'

class RubyRacer

  attr_reader :players, :length

  def initialize(players, length = 30)
    @players = players
    @length = length
    @board = []
  end

  def create_board
    players.each_with_index do |player,index|
     @board[index] = Array.new(@length -1, " ") #
     @board[index].unshift player # adds objects to the front of self
    end
  end
  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
  end

  # Rolls the dice and advances +player+ accordingly

        # @board[index] = @players[index]

        # the current player has the index of [index]
        # eg player 'a' has index 0
        # therefore we can look at @board[0] to see player a's current position in the game
        # now we have @board[index] we can look for the player in @board[index]
        # so where is 'a|' in the array @board[index]
  def advance_player!(player_letter)
    # @players = ['a','b']
    # player = 'a'
    # player_index_number = nil
    # players.each_with_index do |p,index|
    #   if p == player_letter
    #     player_index_number = index
    #   puts index
    #   end
    # end
    # roll_dice = rand(1..6)
    @board.each_with_index do |row, i|
      if row.include?(player_letter)
        current_position = row.index(player_letter)
        # new_position = current_position + rand(1..6)
        @board[i][current_position + rand(1..6)] = player_letter
        @board[i][current_position]= " "
        sleep(0.5)
      end
    end
  end

  # Prints the current game board
  # The board should have the same dimensions each time
  # and you should print over the previous board
  def print_board
     move_to_home! #moves cursor to front left of terminal
    p @board

  end
end


############ DRIVER CODE ############################
players = ['a', 'b']

game = RubyRacer.new(players)
game.create_board
# game.advance_player!("a")
# game.advance_player!("b")
# game.advance_player!("a")
# game.advance_player!("b")


# This clears the screen, so the fun can begin
clear_screen!

until game.finished?
  players.each do |player|
    # This moves the cursor back to the upper-left of the screen
    move_to_home!

    # We print the board first so we see the initial, starting board
    game.print_board
    game.advance_player!(player)

    # We need to sleep a little, otherwise the game will blow right past us.
    # See http://www.ruby-doc.org/core-1.9.3/Kernel.html#method-i-sleep
    sleep(0.5)
  end
end

# The game is over, so we need to print the "winning" board
game.print_board

puts "Player '#{game.winner}' has won!"
