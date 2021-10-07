DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  if integer == 0
    return DIGITS.values_at(integer)[0]
  end
  array = []
  num = 0
  while integer > 0
    num = 9
    while (integer - num) % 10 != 0
      num -= 1
    end
    array << num
    integer /= 10
  end
  array.reverse.map { |el| el = DIGITS.values_at(el)[0] }.join
end

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
