require 'io/console'

CARD_VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
FACE_CARD = 10
ACE = 11
ACE_DIFF = 10

LIMIT = 21
DEALER_STAND = 17

DECK = {
  'hearts' => { values: CARD_VALUES, symbol: "\u2665" },
  'diamonds' => { values: CARD_VALUES, symbol: "\u2666" },
  'clubs' => { values: CARD_VALUES, symbol: "\u2663" },
  'spades' => { values: CARD_VALUES, symbol: "\u2660" }
}

RULES = <<-MSG
*****************************************************
                   Welcome to #{LIMIT}!
Two cards are dealt at the start of the game to the
player and the dealer. The first card of the dealer
is hidden from the player until the end of the round.

The player can then choose to hit or stand, and the
goal is to not go over the number #{LIMIT} while still
having a higher number than the dealer. The dealer
then has its turn, and the dealer will hit until #{DEALER_STAND}
or the player is closer to #{LIMIT}.

Face cards are worth #{FACE_CARD} and aces are worth #{ACE}. Each
ace can be changed to a value of #{ACE - ACE_DIFF} if over #{LIMIT}.

                     Have fun!
*****************************************************
MSG

def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player, dealer, score, other_score, end_loop)
  if end_loop
    STDOUT.clear_screen
    prompt "Score: #{score} : #{other_score}"
    puts "+===============+"
    prompt "Dealer shows:"
    dealer.each do |key, value|
      value.each { |num| puts "     #{key} | #{num}" }
    end
    puts "+===============+"
    prompt "Your hand:"
    player.each do |key, value|
      value.each { |num| puts "     #{key} | #{num}" }
    end
    puts "+===============+"
  else
    STDOUT.clear_screen
    prompt "Score: #{score} : #{other_score}"
    puts "+===============+"
    prompt "Dealer shows:"
    dealer.reject { |_, value| value.empty? }.each_with_index do |(key, value), index|
      if index == 0 && value.size == 1
        puts "     ? | ?"
      elsif index == 0 && value.size > 1
        puts "     ? | ?"
        value.each_with_index do |num, index_inner|
          if index_inner > 0
            puts "     #{key} | #{num}"
          end
        end
      else
        value.each { |num| puts "     #{key} | #{num}" }
      end
    end
    puts "+===============+"
    prompt "Your hand:"
    player.each do |key, value|
      value.each { |num| puts "     #{key} | #{num}" }
    end
    puts "+===============+"
  end
end

def deal_cards(number, hand, other_hand)
  name = ''
  number.times do
    name = DECK.keys.sample
    suit = DECK[name][:symbol]
    if !hand[suit]
      hand[suit] = []
    end
    if !other_hand[suit]
      other_hand[suit] = []
    end
    hand[suit] << DECK[name][:values].reject { |el| hand[suit].include?(el) || other_hand[suit].include?(el) }.sample
  end
  hand
end

def detect_value(hand)
  values = hand.values.flatten.map do |el|
    case el
    when 'A'
      ACE
    when 'K'
      FACE_CARD
    when 'Q'
      FACE_CARD
    when 'J'
      FACE_CARD
    else
      el.to_i
    end
  end
  sum = values.sum
  hand.values.flatten.select { |value| value == 'A' }.count.times do
    sum -= ACE_DIFF if sum > LIMIT
  end
  sum
end

def busted?(sum)
  sum > LIMIT
end

def update_score(sum, other_sum, score, other_score)
  if sum > other_sum && sum <= LIMIT || other_sum > LIMIT
    score += 1
  elsif other_sum > sum && other_sum <= LIMIT || sum > LIMIT
    other_score += 1
  end
  return score, other_score
end

def display_winner(sum, other_sum)
  if sum > other_sum && sum <= LIMIT || other_sum > LIMIT
    prompt "You won!"
  elsif other_sum > sum && other_sum <= LIMIT || sum > LIMIT
    prompt "The dealer won!"
  else
    prompt "It's a tie!"
  end
end

def display_set_score(score, other_score)
  if score > other_score
    prompt "You won the set! Play again? (y or n)"
  elsif other_score > score
    prompt "Dealer won the set! Play again? (y or n)"
  else
    prompt "The set is a tie! Play again? (y or n)"
  end
end

loop do
  player_score = 0
  dealer_score = 0

  loop do
    STDOUT.clear_screen
    puts RULES
    prompt "Press enter to continue"
    answer = gets
    break if answer == "\n"
  end

  loop do
    player_hand = {}
    dealer_hand = {}

    player_hand = deal_cards(2, player_hand, dealer_hand)
    dealer_hand = deal_cards(2, dealer_hand, player_hand)

    player_sum = detect_value(player_hand)
    dealer_sum = detect_value(dealer_hand)

    display_hands(player_hand, dealer_hand, player_score, dealer_score, FALSE)

    loop do
      prompt "Hit or stand?"
      answer = gets.chomp
      break if answer == 'stand'
      player_hand = deal_cards(1, player_hand, dealer_hand)
      player_sum = detect_value(player_hand)
      display_hands(player_hand, dealer_hand, player_score, dealer_score, FALSE)
      break if busted?(player_sum)
    end

    if busted?(player_sum)
      prompt "Oh no, you busted!"
      sleep(2)
    else
      prompt "You chose to stand!"
      sleep(2)
    end

    loop do
      break if busted?(player_sum) || busted?(dealer_sum)
      prompt "Dealer turn:"
      sleep(2)
      if dealer_sum < DEALER_STAND
        dealer_hand = deal_cards(1, dealer_hand, player_hand)
        dealer_sum = detect_value(dealer_hand)
        display_hands(player_hand, dealer_hand, player_score, dealer_score, FALSE)
        prompt "Dealer hits"
        sleep(2)
      else
        break
      end
    end

    if busted?(dealer_sum)
      prompt "Dealer busted!"
      sleep(2)
    elsif busted?(player_sum)
    else
      prompt "Dealer chose to stand!"
      sleep(2)
    end

    player_score, dealer_score = update_score(player_sum, dealer_sum, player_score, dealer_score)
    display_hands(player_hand, dealer_hand, player_score, dealer_score, TRUE)
    display_winner(player_sum, dealer_sum)

    prompt "Stay at the table? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
  display_set_score(player_score, dealer_score)
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

STDOUT.clear_screen
prompt "Thanks for playing #{LIMIT}. Goodbye!"
