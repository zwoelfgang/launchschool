def halvsies(array)
  case
  when array.size.odd? == true
    array1 = array[0..(array.size / 2)]
    array2 = array[(array.size / 2 + 1)..array.size]
  else
    array1 = array[0..(array.size / 2 - 1)]
    array2 = array[(array.size / 2)..array.size]
  end
  full_array = [array1, array2]
end

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
