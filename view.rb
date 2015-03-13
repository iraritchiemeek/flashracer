require_relative 'racer_utils'

class View
  attr_reader :players, :player_name
  def initialize
    @player_name = ''
    @players =[]
  end

  def render_player_names(players)
    players.each_index do |index|
      puts "#{index+1}. #{players[index]}"
    end
  end

  def initialize_game_render
    puts 'Welcome to Flash-Racer. !!!. (v1. Release 1.0.0)'
    puts 'You will answer questions which will make you advance on the track.'
    puts 'The first racer to reach the end of the track wins!.'
  end

  def enter_names_render
    @players = []
    for i in 1..2
      puts "Player #{i}, please enter your name"
      @player_name = gets.chomp
      @players.push @player_name
    end
    display_current_players
    @players
  end

  def display_current_players
    current_players_heading = "Current players"
    puts current_players_heading
    puts "----------------------"
    @players.each_index do |index|
      puts "#{index+1}. #{@players[index]}"
    end
    puts "----------------------"
  end

  def display_player(player)
    puts "#{player}"
  end

  def render_score(player_score)
        clear_screen!
    move_to_home!

      puts "Your score is #{player_score}"
  end

  def render_track(track)
    #render the track here...
    puts track.map {|row| row.join('|')}
  end

  def render_question(question)
    puts "Question : #{question}"
  end

  def render_answer(answer)
    puts "The answer is : #{answer}"
  end

  def render_winner(winner)
    puts "Congratulations #{winner}, you have WON!!!"
  end

  def render_wrong_answer(answer)
    puts "Sorry. The answer is #{answer}."
  end

  def render_correct_answer
    puts 'Correct'
  end

  def get_answer
    puts 'Enter your answer'
    answer = gets.chomp
    answer
  end

end

#Driver Test Code
# my_view = View.new
# my_view
# puts my_view.render_wrong_answer('Driver test')
# puts "#{my_view.render_wrong_answer('Driver test') == 'Sorry. The answer is Driver test. Try again.'} : Returns wrong answer message"

# names = []
# names.push 'John'
# names <<'Raquel'
# names.push 'Geordie'
# my_view.render_player_names(names)

# my_view.render_question('Question is ....')
# my_view.render_answer('Answer is ...')
# puts "#{my_view.render_winner('Joe')}"
# puts "#{my_view.render_winner("Joe") == 'Congratulations Joe, you have WON!!!'} : Returns correct winner name"

#test push

