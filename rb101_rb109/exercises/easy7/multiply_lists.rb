def multiply_list(array1, array2)
  count = 0
  array = []
  while count < array1.size
    array << array1[count] * array2[count]
    count += 1
  end
  array
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
