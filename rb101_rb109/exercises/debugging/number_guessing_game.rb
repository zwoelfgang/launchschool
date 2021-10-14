def valid_integer?(string)
  string.to_i.to_s == string
end

def attempt(winning_number, attempts, max_attempts)
  attempts += 1

  input = nil
  until valid_integer?(input)
    print 'Make a guess: '
    input = gets.chomp
  end

  guess = input.to_i

  if guess == winning_number
    puts 'Yes! You win.'
  else
    puts 'Nope. Too small.' if guess < winning_number
    puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
    attempt(winning_number, attempts, max_attempts) if attempts < max_attempts
  end
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  attempt(winning_number, attempts, max_attempts)
end

guess_number(10, 3)
