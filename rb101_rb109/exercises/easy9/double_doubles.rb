def twice(number)
  array = number.digits.reverse
  count = 0
  if array[0..array.size / 2 - 1] == array[array.size / 2..array.size] && array.size > 1
    array.join.to_i
  else
    array.join.to_i * 2
  end
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
