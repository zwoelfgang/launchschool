def sum(num)
  num_sum = num.to_s.chars.reduce { |num_sum, el| num_sum.to_i + el.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
