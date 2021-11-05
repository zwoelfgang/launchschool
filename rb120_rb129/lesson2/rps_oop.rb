require 'io/console'

module Displayable
  SET = 10
  RULES = <<-MSG
  ************************************_\u2660_RPSLS_\u2660_******************************************
  |  Rock beats lizard and scissors, Paper beats rock and spock,                          |
  |  Scisssors beats paper and lizard, Spock beats scissors and rock,                     |
  |  Lizard beats spock and paper                                                         |
  |---------------------------------------------------------------------------------------|
  |  Each computer player has a different style; see if you can figure it out! ;)         |
  |  First to #{SET} wins. Ties count as no points for the player and computer. Ready? Go!    |
  *****************************************************************************************
  MSG

  def display_welcome_message
    puts "=> Welcome to Rock, Paper, Scissors, (Spock and Lizard) " \
      "#{human.name}!"
  end

  def display_rules
    puts RULES
  end

  def display_goodbye_message
    puts "=> Thanks for playing Rock, Paper, Scissors, " \
         "(Spock and Lizard). Goodbye, #{human.name}!"
  end

  def display_moves
    puts "=> #{human.name} chose #{human.move}"
    puts "=> #{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "=> #{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "=> #{computer.name} won!"
      computer.score += 1
    else
      puts "=> It's a tie!"
    end
  end

  def display_score(human, computer)
    puts "=> #{human.name}: #{human.score} | " \
         "#{computer.name}: #{computer.score}"
  end

  def display_set_winner
    if human.score > computer.score
      puts "=> Yay, #{human.name} won the set!"
    elsif human.score < computer.score
      puts "=> Oh no, #{computer.name} won the set!"
    else
      puts "=> Tie game!"
    end
  end
end

class Move
  attr_reader :value

  VALUES = {
    'rock' => ['lizard', 'scissors'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'spock' => ['scissors', 'rock'],
    'lizard' => ['spock', 'paper']
  }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    VALUES.values_at(value).flatten.include?(other_move.value)
  end

  def <(other_move)
    VALUES.values_at(other_move.value).flatten.include?(value)
  end

  def to_s
    @value
  end
end

class Player
  include Displayable

  attr_accessor :score
  attr_reader :name, :move

  def initialize
    set_name
    @score = 0
  end

  private

  attr_writer :name, :move

  @@history = Hash.new([])

  def resume_playing
    loop do
      puts "=> Press 'Enter' to go back to the game."
      answer = gets
      break if answer[-1] == "\n"
    end
  end

  def store_move
    @@history[name] += [move.value]
  end

  def print_history(computer)
    STDOUT.clear_screen
    @@history.each do |key, value|
      puts "=> #{key} chose:"
      value.each { |element| puts '=>   ' + element }
    end
    resume_playing
    STDOUT.clear_screen
    display_rules
    display_score(self, computer)
  end
end

class Human < Player
  def set_name
    STDOUT.clear_screen
    n = ''
    loop do
      puts "=> What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "=> Sorry, must enter a value."
    end
    self.name = n
  end

  def choose(computer)
    choice = nil
    loop do
      puts "=> Please choose rock, paper, scissors, spock or lizard" \
           " (or enter 'history' to see past moves):"
      choice = gets.chomp.downcase
      if choice == 'history'
        print_history(computer)
        next
      end
      break if Move::VALUES.keys.include?(choice)
      puts "=> Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    store_move
  end
end

class R2D2 < Player
  def set_name
    @name = 'R2D2'
  end

  def choose(*)
    self.move = Move.new(Move::VALUES.keys.sample)
    store_move
  end
end

class Hal < Player
  def set_name
    @name = 'Hal'
  end

  def choose(human_name)
    last_move = @@history[human_name].last
    array = Move::VALUES.select { |_, value| value.include?(last_move) }.keys
    self.move = Move.new(array.sample)
    store_move
  end
end

class Chappie < Player
  def set_name
    @name = 'Chappie'
  end

  def choose(human_name)
    previous_move = @@history[human_name][-2]
    array = if previous_move
              Move::VALUES.select do |_, value|
                value.include?(previous_move)
              end.keys
            else
              [Move::VALUES.keys.sample]
            end
    self.move = Move.new(array.sample)
    store_move
  end
end

class Sonny < Player
  def set_name
    @name = 'Sonny'
  end

  def choose(human_name)
    previous_move = Move::VALUES.values_at(@@history[human_name][-2]).flatten
    array = Move::VALUES.select do |key, value|
      key != previous_move[0] && key != previous_move[1] &&
        (!value.include?(previous_move[0]) || !value.include?(previous_move[1]))
    end.keys
    self.move = Move.new(array.sample)
    store_move
  end
end

class Number5 < Player
  def set_name
    @name = 'Number 5'
  end

  def choose(*)
    self.move = Move.new(Move::VALUES.keys[4])
    store_move
  end
end

class RPSGame
  include Displayable

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, Chappie.new, Sonny.new, Number5.new].sample
  end

  def play
    STDOUT.clear_screen
    display_welcome_message
    sleep(2)
    loop do
      STDOUT.clear_screen
      display_rules
      display_score(human, computer)
      human.choose(computer)
      computer.choose(human.name)
      display_moves
      display_winner
      break if set_winner?
      break unless play_again?
    end
    STDOUT.clear_screen
    display_set_winner
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def play_again?
    answer = nil
    loop do
      puts "=> Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer[0])
      puts "=> Sorry, must be y or n."
    end

    return false if answer.start_with?('n')
    return true if answer.start_with?('y')
  end

  def set_winner?
    human.score >= SET || computer.score >= SET
  end
end

RPSGame.new.play
