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

  attr_reader :players, :winner, :racer

  def initialize
   @players = [] # make an empty players array which both player will be pushed into
   2.times {@players << Player.new} # two time smake a new player and push them into the empty array
   file_parsing # call the file parsing method
   @finished = false
   @racer = Racer.new(@players)
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
    @flashcards.shuffle.shift# take the flashcards array and sample a card from it
  end

  def display_score(player)
    @players[player].score # pass in a player index on the players array, and display the score
  end

  def update_score(player_index)
    @players[player_index].player_score += 1 #will take the players array, pass it a player index and increment the score by +=1 each correct answer they get
    p @racer.length
    if @players[player_index].player_score == @racer.length
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

  def add_player_names(array)
     @players[0].player_name = array.first
     @players[1].player_name = array.last
  end

end
##############################################################

class Racer

  attr_reader :players, :winner, :board,:length

  def initialize(players, length = 4)
    @players = players
    @board = []
    @length = length
    @winner = nil
  end

  def create_board
    @players.each_with_index do |player, index| # takes players and
      @board[index] = Array.new(@length, " ")
      @board[index][0] = 'X'
    end
  end

  def advance_player(player_index)
    previous_index = @board[player_index].index("X")
    @board[player_index][previous_index] = " "
    @board[player_index][previous_index + 1 ] = "X"
  end

end

class ArtParsing
  attr_reader :art

  def initialize
    @art = File.readlines('art.txt')
  end

  def print_logo(sleep_value)
    @art.each do |line|
      puts line
      sleep(sleep_value)
    end
  end

    def intro
    sleep_value=0.5
    puts
    puts "Loading..."
    2.times {sleep(sleep_value)}
    print_logo sleep_value
    puts "100% Loaded."
    sleep(sleep_value)
    puts
    puts "Created by Racquet, French Fry, Pete Rabbit, Johnny-Boy, G-Dawg and IraRitchieRich"
    puts
    puts "Open Sourced under MIT license - Dev Academy 2015"
    puts
  end

end







