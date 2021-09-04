require 'yaml'
require 'io/console'
require 'pry'

PROMPTS = YAML.load_file('rps_prompts.yml')

MOVE_INPUT = {
  'scissors' => %w(paper lizard),
  'paper' => %w(rock spock),
  'rock' => %w(lizard scissors),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

MOVE_NAMES = {
  'scissors' => %w(scissors s),
  'paper' => %w(paper p),
  'rock' => %w(rock r),
  'lizard' => %w(lizard l),
  'spock' => %w(spock S Spock)
}

player_won = 0
computer_won = 0

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  MOVE_INPUT[first].include?(second)
end

def winner(wins_player)
  if wins_player >= 3
    prompt(PROMPTS['won'])
  elsif wins_player < 3
    prompt(PROMPTS['lost'])
  else
    prompt(PROMPTS['tied'])
  end
end

def move_valid?(user_input)
  move = ''
  MOVE_NAMES.each do |key, value|
    if value.include?(user_input)
      move = key
      break
    else
      move = nil
    end
  end
  move
end

def display_results(player, computer)
  if win?(player, computer)
    prompt(PROMPTS['winner'])
  elsif win?(computer, player)
    prompt(PROMPTS['loser'])
  else
    prompt(PROMPTS['tie'])
  end
end

def score(player, computer, wins_player, wins_computer)
  if win?(player, computer)
    wins_player += 1
  elsif win?(computer, player)
    wins_computer += 1
  else
    wins_player += 0.5
    wins_computer += 0.5
  end
  return wins_player, wins_computer
end

STDOUT.clear_screen

prompt(PROMPTS['welcome'])
prompt(PROMPTS['rules'])

catch :restart do
  loop do
    choice = ''
    key = ''

    prompt(PROMPTS['choice'])

    loop do
      choice = gets.chomp
      key = move_valid?(choice)
      if key
        break
      else
        prompt(PROMPTS['invalid'])
      end
    end

    computer_choice = MOVE_NAMES.keys.sample

    prompt("You chose #{key}; Computer chose: #{computer_choice}")

    display_results(key, computer_choice)
    player_won, computer_won = score(key, computer_choice,
                                     player_won, computer_won)

    prompt("The score is: player = #{player_won} : computer = #{computer_won}")

    break if player_won >= 3 || computer_won >= 3

    prompt(PROMPTS['again'])
    answer = gets.chomp.downcase

    loop do
      case answer
      when 'y'
        STDOUT.clear_screen
        break
      when 'n'
        throw :restart
      else
        prompt(PROMPTS['restart'])
        answer = gets.chomp.downcase
      end
    end
  end
end

STDOUT.clear_screen

winner(player_won)
prompt(PROMPTS['goodbye'])
