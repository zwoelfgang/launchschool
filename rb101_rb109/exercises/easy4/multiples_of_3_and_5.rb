def multisum(num)
  sum = 0
  (1..num).each do |el|
    if el % 3 == 0 || el % 5 == 0
      sum += el
    end
  end
  sum
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
