def fibonacci(number)
  array = [1, 1]
  count = 0
  if number == 1 || number == 2
    return 1
  else
    while count < number - 2
      fib_number = array[-2] + array[-1]
      array << fib_number
      count += 1
    end
  end
  fib_number
end


fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
