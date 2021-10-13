def sum_square_difference(number)
  sum = 0
  square = 0
  (1..number).each do |num|
    sum += num
  end
  sum = sum ** 2
  (1..number).each do |num|
    square += num ** 2
  end
  sum - square
end

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
