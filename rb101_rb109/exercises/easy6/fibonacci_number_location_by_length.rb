def find_fibonacci_index_by_length(length)
  index = 2
  array = [1, 1]
  while array[-1].to_s.size < length
    array << array[-1] + array[-2]
    index += 1
  end
  index
end

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
