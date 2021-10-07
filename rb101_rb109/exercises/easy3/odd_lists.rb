def oddities(array)
  new_array = []
  array.each_with_index do |num, index|
    if !index.odd?
      new_array << num
    end
  end
  new_array
end

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
