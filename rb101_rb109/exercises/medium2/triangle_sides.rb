def triangle(num1, num2, num3)
  case
  when num1 > num2 && num2 >= num3
    return :invalid if num3 + num2 < num1
  when num2 > num3 && num3 >= num1
    return :invalid if num1 + num3 < num2
  when num3 > num2 && num2 >= num1
    return :invalid if num1 + num2 < num3
  when (num1 == 0 || num2 == 0 || num3 == 0)
    return :invalid
  end
  case
  when num1 == num2 && num2 == num3
    :equilateral
  when num1 != num2 && num2 != num3
    :scalene
  else
    :isosceles
  end
end

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
