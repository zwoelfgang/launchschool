def negative(number)
  if number > 0
    number = -number
  end
  number
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby
