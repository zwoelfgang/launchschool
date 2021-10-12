def fizzbuzz(start_num, end_num)
  array = []
  count = start_num
  while count <= end_num
    if count % 3 == 0 && count % 5 == 0
      array << "FizzBuzz"
    elsif count % 3 == 0
      array << "Fizz"
    elsif count % 5 == 0
      array << "Buzz"
    else
      array << count
    end
    count += 1
  end
  puts array.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
