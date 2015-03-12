class View
  attr_reader :players, :player_name
  def initialize
    @player_name = ''
    @players =[]
    initialize_game_render
  end

  def render_player_names
  end

  def initialize_game_render
    puts 'Welcome to Flash-Racer. !!!.'
    puts 'You will answer questions which will make you advance on the track.'
    puts 'The first racer to reach the end of the track wins!.'

    enter_names_render
  end

  def enter_names_render
    @players = []
    for i in 1..2
      puts "Player #{i}, please enter your name"
      @player_name = gets.chomp
      @players.push @player_name
    end

     puts "Current players"
     puts "----------------------"
    @players.each_index do |index|
      puts "#{index+1}. #{@players[index]}"
    end
    puts "----------------------"
  end

  def render_scores
  end

  def render_track
  end

  def render_question
  end

  def render_answer
  end

  def render_winner
  end

  def render_wrong_answer
  end

end

#Driver Test Code
my_view = View.new
my_view
