def interleave(array1, array2)
  counter = 0
  array = []
  while counter < array1.size
    array << array1[counter]
    array << array2[counter]
    counter += 1
  end
  array
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
