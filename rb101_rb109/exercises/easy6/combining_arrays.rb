def merge(array1, array2)
  array1 + array2.reject { |el| array1.include?(el) }
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
