require 'io/console'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
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

def display_board(brd)
  STDOUT.clear_screen
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
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

def open_place_in_line(brd, line)
  line.select { |value| brd[value] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  threat_line = detect_immediate_threat(brd).flatten
  opportunity_line = detect_immediate_opportunity(brd).flatten
  possibility_line = detect_opportunity(brd).flatten
  if !opportunity_line.empty?
    square = open_place_in_line(brd, opportunity_line).sample
  elsif !threat_line.empty?
    square = open_place_in_line(brd, threat_line).sample
  elsif !possibility_line.empty?
    square = open_place_in_line(brd, possibility_line).sample
  elsif empty_squares(brd).include?(5)
    square = 5
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

player_score = 0
computer_score = 0

while player_score < 5 && computer_score < 5
  current_player = decide_current_player

  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == "Player"
      player_score += 1
    elsif detect_winner(board) == "Computer"
      computer_score += 1
    end
  else
    prompt "It's a tie!"
    player_score += 0.5
    computer_score += 0.5
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "#{detect_winner(board)} won the set!"
prompt "Thanks for playing Tic Tac Toe. Goodbye!"
