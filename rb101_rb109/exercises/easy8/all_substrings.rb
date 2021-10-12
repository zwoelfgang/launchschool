def substrings(string)
  array = []
  count_inner = 0
  count_outer = 0
  while count_outer < string.length
    while count_inner < string.length
      array << string[count_outer..count_inner]
      count_inner += 1
    end
    count_outer += 1
    count_inner = count_outer
  end
  array
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
