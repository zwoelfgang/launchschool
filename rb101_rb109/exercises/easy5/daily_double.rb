def crunch(string)
  array = []
  characters = string.chars
  array << characters[0]
  crunched_string = string.chars.map do |char|
    if char == array[-1] && array.size > 1
      array << char
      char = ''
    else
      array << char
      char
    end
  end
  crunched_string.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
