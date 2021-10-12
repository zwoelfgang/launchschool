def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, count)
  all_digits = number.digits.reverse
  leftmost_digits = all_digits[0..(all_digits.size - count) - 1]
  rightmost_digits = all_digits[all_digits.size - count..-1]
  if leftmost_digits.size >= all_digits.size
    rotate_array(rightmost_digits).join.to_i
  else
    (leftmost_digits + rotate_array(rightmost_digits)).join.to_i
  end
end

def max_rotation(number)
  size = number.to_s.length
  while size > 0
    number = rotate_rightmost_digits(number, size)
    size -= 1
  end
  number
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
