DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(integer)
  if integer == 0
    return DIGITS.values_at(integer)[0]
  end
  array = []
  num = 0
  if integer.abs != integer
    integer = integer.abs
    while integer > 0
      num = 9
      while (integer - num) % 10 != 0
        num -= 1
      end
      array << num
      integer /= 10
    end
    '-' + array.reverse.map { |el| el = DIGITS.values_at(el)[0] }.join
  else
    while integer > 0
      num = 9
      while (integer - num) % 10 != 0
        num -= 1
      end
      array << num
      integer /= 10
    end
    '+' + array.reverse.map { |el| el = DIGITS.values_at(el)[0] }.join
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
