def reverse!(array)
  counter = (array.size / 2) + 1
  anti_counter = (array.size / 2) - 1
  while anti_counter >= 0
    first = array[counter]
    last = array[anti_counter]
    array[counter] = last
    array[anti_counter] = first
    counter += 1
    anti_counter -= 1
  end
  array.reject! { |el| el == nil }
  array
end

def reverse(array)
  counter = (array.size / 2) + 1
  anti_counter = (array.size / 2) - 1
  reversed_array = []
  while anti_counter >= 0
    reversed_array[counter] = array[anti_counter]
    reversed_array[anti_counter] = array[counter]
    counter += 1
    anti_counter -= 1
  end
  anti_counter = array.size / 2
  counter = array.size / 2
  reversed_array[anti_counter] = array[counter]
  reversed_array.reject! { |el| el == nil }
  reversed_array
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
