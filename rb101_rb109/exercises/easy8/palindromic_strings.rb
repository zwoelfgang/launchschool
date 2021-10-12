def palindromes(string)
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
  array.select { |str| str if str == str.reverse && str.length > 1 }
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
