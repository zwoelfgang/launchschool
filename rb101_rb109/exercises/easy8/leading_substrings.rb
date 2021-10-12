def leading_substrings(string)
  array = []
  count = 0
  while count < string.length
    array[count] = string[0..count]
    count += 1
  end
  array
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
