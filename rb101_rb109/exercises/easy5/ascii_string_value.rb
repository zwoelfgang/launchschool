def ascii_value(string)
  array = string.chars
  array.map {|char| char.ord }.sum
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
