def sum_of_sums(array)
  sum = 0
  if array.size > 1
    array.each_index do |index|
      sum += array[0..index].inject(:+)
    end
  else
    sum += array[0]
  end
  sum
end

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
