def add(i, j)
  return i + j
end

def multiply(i, j)
  return i * j
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36