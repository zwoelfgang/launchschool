def featured(number)
  count = 0
  while true
    if count > number && count.odd? && count % 7 == 0 && count.digits.uniq.size == count.digits.size
      return count
    else
      count += 1
    end
    break if count >= 9_876_543_210
  end
  puts "There is no possible number that fulfills those requirements."
end

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
