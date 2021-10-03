def stringy(num)
  chars = []
  num.times do |index|
    if index.even?
      chars[index] = '1'
    else
      chars[index] = '0'
    end
  end
  chars.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
