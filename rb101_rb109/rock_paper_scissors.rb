require 'yaml'
require 'io/console'

PROMPTS = YAML.load_file('rps_prompts.yml')

MOVES = {
  'scissors' => { beats: %w(paper lizard), alias: 's' },
  'paper' => { beats: %w(rock spock), alias: 'p' },
  'rock' => { beats: %w(lizard scissors), alias: 'r' },
  'lizard' => { beats: %w(spock paper), alias: 'l' },
  'spock' => { beats: %w(scissors rock), alias: 'sp' }
}

player_won = 0
computer_won = 0

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  MOVES.fetch(first).fetch(:beats).include?(second)
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
  MOVES.each do |key, value|
    if value[:alias].include?(user_input)
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
prompt(PROMPTS['beats'])
prompt(PROMPTS['rules'])
prompt(PROMPTS['moves'])

catch :restart do
  loop do
    choice = ''
    key = ''

    prompt(PROMPTS['choice'])

    loop do
      choice = gets.chomp.downcase
      key = move_valid?(choice)
      if key
        break
      else
        prompt(PROMPTS['invalid'])
      end
    end

    computer_choice = MOVES.keys.sample

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
