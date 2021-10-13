def triangle(num1, num2, num3)
  case
  when (num1 + num2 + num3 != 180 || num1 == 0 || num2 == 0 || num3 == 0)
    :invalid
  when (num1 == 90 || num2 == 90 || num3 == 90)
    :right
  when (num1 > 90 || num2 > 90 || num3 > 90)
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
