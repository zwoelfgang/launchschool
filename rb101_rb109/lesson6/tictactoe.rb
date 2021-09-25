require 'io/console'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
CORNERS = [1, 3, 7, 9]
CENTER_SQUARE = 5
TOTAL_SQUARES = 9

RULES = <<-MSG
*******************************************
This is a turn-based game against the
computer where if you can place an '#{PLAYER_MARKER}' in
three spaces in a row (diagonals count),
you win. The computer tries to do the same
with '#{COMPUTER_MARKER}' and whoever is first to three
                 wins!

Squares are numbered 1 -- 9 from left to
right and in descending rows:

                 1|2|3
                 -+-+-
                 4|5|6
                 -+-+-
                 7|8|9

            Have fun playing!
*******************************************
MSG

def prompt(msg)
  puts "=> #{msg}"
end

def welcome_and_rules
  puts "*****-----Welcome to Tic Tac Toe!-----*****"
  puts RULES
end

def decide_current_player
  current_player = ''
  loop do
    prompt "Choose who to start: you, or the computer. You can also choose to let the computer decide."
    prompt "('p' for player, 'c' for computer, and 'f' to forfeit the decision):"
    decision = gets.chomp

    if decision.downcase.start_with?('p')
      current_player = "p"
      break
    elsif decision.downcase.start_with?('c')
      current_player = "c"
      break
    elsif decision.downcase.start_with?('f')
      current_player = ['p', 'c'].sample
      break
    else
      prompt "Sorry, that's not a valid choice."
    end
  end
  current_player
end

def display_board(brd, player, computer)
  STDOUT.clear_screen
  prompt "The score is #{player} for the player to #{computer} for the computer."
  prompt "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..TOTAL_SQUARES).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(squares_free, delim=', ', end_delim='or ')
  string = ''
  squares_free.each do |num|
    if num == squares_free.last
      string << end_delim + num.to_s
    else
      string << num.to_s + delim
    end
  end
  string
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def detect_immediate_opportunity(brd)
  WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
      brd.values_at(*line).count(PLAYER_MARKER) == 0
  end
end

def detect_immediate_threat(brd)
  WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).count(COMPUTER_MARKER) == 0
  end
end

def detect_opportunity(brd)
  WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 1 &&
      brd.values_at(*line).count(PLAYER_MARKER) == 0
  end
end

def detect_threat(brd)
  WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 1 &&
      brd.values_at(*line).count(COMPUTER_MARKER) == 0
  end
end

def open_place_in_line(brd, line)
  line.select { |value| brd[value] == INITIAL_MARKER }
end

def center_taken?(brd)
  if empty_squares(brd).size == TOTAL_SQUARES - 1 && brd[CENTER_SQUARE] == PLAYER_MARKER
    TRUE
  else
    FALSE
  end
end

def computer_places_piece!(brd)
  danger_line = detect_immediate_threat(brd).flatten
  threat_line = detect_threat(brd).flatten
  opportunity_line = detect_immediate_opportunity(brd).flatten
  possibility_line = detect_opportunity(brd).flatten
  only_center_taken = center_taken?(brd)
  if only_center_taken
    square = CORNERS.sample
  elsif !opportunity_line.empty?
    square = open_place_in_line(brd, opportunity_line).sample
  elsif !danger_line.empty?
    square = open_place_in_line(brd, danger_line).sample
  elsif !possibility_line.empty?
    square = open_place_in_line(brd, possibility_line).sample
  elsif !threat_line.empty?
    square = open_place_in_line(brd, threat_line).sample
  elsif empty_squares(brd).include?(CENTER_SQUARE)
    square = CENTER_SQUARE
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == 'p'
    player_places_piece!(brd)
  elsif player == 'c'
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == 'p'
    'c'
  elsif player == 'c'
    'p'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def update_score(brd, player, computer)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
    if detect_winner(brd) == "Player"
      player += 1
    elsif detect_winner(brd) == "Computer"
      computer += 1
    end
  else
    prompt "It's a tie!"
    player += 0.5
    computer += 0.5
  end
  return player, computer
end

def display_set(player, computer)
  if player > computer
    prompt "The player won the set! #{player} : #{computer}"
  elsif player < computer
    prompt "The computer won the set! #{player} : #{computer}"
  else
    prompt "The set is tied! #{player} : #{computer}"
  end
end

loop do
  player_score = 0
  computer_score = 0

  welcome_and_rules

  while player_score < 5 && computer_score < 5
    current_player = decide_current_player

    board = initialize_board

    loop do
      display_board(board, player_score, computer_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    player_score, computer_score = update_score(board, player_score, computer_score)

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  display_set(player_score, computer_score)

  prompt "Rematch? (y or n)"
  rematch = gets.chomp
  break unless rematch.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
