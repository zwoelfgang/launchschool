def multiply_all_pairs(array1, array2)
  count = 0
  array = []
  if array1.size > array2.size
    while count < array2.size
      array1.each do |num|
        array << num * array2[count]
      end
      count += 1
    end
  else
    while count < array1.size
      array2.each do |num|
        array << num * array1[count]
      end
      count += 1
    end
  end
  array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
