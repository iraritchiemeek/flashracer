# flashcard class that takes a question and answer
# Model class that contains the logic for the game
#######################################################

class FlashCard

  attr_reader :question, :answer

  def initialize(question,answer)
    @question = question.chomp
    @answer = answer.chomp
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
 #create a players array
 # makes the players (2) and push into players array
 #call file parsing method on init
  end

  def file_parsing
    # create flash cards empty array
 #takes the .txt file and splits the lines to be returned by index
  end

  # def display_score
  #   #takes the player, and displays the init score (which will be 0)
  # end

  def update_score
    #will take the player, and increment the score by +=1 each correct answer they get
  end

  # def set_player_name

  # end

  # def display_player_name

  # end

  def get_current_card
    #takes the
  end

end
##############################################################
