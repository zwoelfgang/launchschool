def ordinal(num)
  if num.digits.reverse[-2..-1]
    case num.digits.reverse[-2..-1].map { |el| el.to_s }.join.to_i
    when 11, 12, 13
      return "th"
    end
  end
  case num.digits.reverse[-1]
  when 0
    "th"
  when 1
    "st"
  when 2
    "nd"
  when 3
    "rd"
  else
    "th"
  end
end

def date_number(array)
  case array[-1]
  when 0
    array[0..-3].map { |el| el.to_s }.join.to_i
  when 1
    array[0..-3].map { |el| el.to_s }.join.to_i + 1
  when 2
    array[0..-3].map { |el| el.to_s }.join.to_i + 1
  when 3
    array[0..-3].map { |el| el.to_s }.join.to_i + 1
  else
    array[0..-3].map { |el| el.to_s }.join.to_i + 1
  end
end

def century(num)
  items = num.digits.reverse
  date = date_number(items)
  ord = ordinal(date)
  date.to_s + ord
end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
