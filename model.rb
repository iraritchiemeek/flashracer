# flashcard class that takes a question and answer
# Model class that contains the logic for the game
#######################################################

class FlashCard

  attr_reader :question, :answer

  def initialize(question,answer)
    @question = question.chomp
    @answer = answer.chomp
  end

  def compare(input)
    if input == @answer
      return true
    else
      return false
    end
  end

end

########################################################

class Player

  attr_accessor :player_name, :player_score

  def initialize
    @player_name = ""
    @player_score = 0
  end

end

########################################################

class FlashModel

  def initialize
   @players = [] # make an empty players array which both player will be pushed into
   2.times {@players << Player.new} # two time smake a new player and push them into the empty array
   file_parsing # call the file parsing method
   @finished = false
  end

  def file_parsing
    @flashcards = [] #make an empty array that the cards will be stored in
    questions = File.readlines('questions.txt') #make questions array wihich will hold all file data
    until questions.empty? # until the questions variable is empty do something
      @question_chunk = questions.slice!(0,3) # question chunks is each line in the file, and splitting them at 0 and 3 index giving me 3 lines
      @flashcards << FlashCard.new(@question_chunk[0],@question_chunk[1]) # pushing the question[0] and answer[1] into flashcards array
    end
  end

  def get_current_card
    @flashcards.sample # take the flashcards array and sample a card from it
  end

  def display_score(player)
    @players[player].score # pass in a player index on the players array, and display the score
  end

  def update_score(player_index)
    @players[player_index].player_score += 1 #will take the players array, pass it a player index and increment the score by +=1 each correct answer they get
    if @players[player_index].player_score == 10
       set_winner(player_index)
       @finished = true
    end
  end

  def set_winner(player_index)
    @winner = @players[player_index]
  end

  def game_finished?
    @finished
  end

end
##############################################################

class Racer

  attr_reader :players. :winner

  def inititalize(players, length = 10)
    @players = players
    @board = []
    @length = length
    @winner = nil
  end

  def create_board
    @players.each_with_index do |player, index| # takes players and
      @board[index] = Array.new(@length -1, " ")
      @board[index].unshift(player)
    end
  end

end

# test = FlashModel.new
# # test.file_parsing
# # p test.get_current_card

racer = Racer.new
p racer.create_board




