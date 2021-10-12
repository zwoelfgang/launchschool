def word_cap(string)
  characters = string.chars
  index = 0
  if 'abcdefghijklmnopqrstuvwxyz'.include?(characters[index])
    characters[index] = characters[index].upcase
    index += 1
  else
    index += 1
    characters[index].upcase
    index += 1
  end
  while index < characters.size
    if characters[index - 1] == ' ' && 'abcdefghijklmnopqrstuvwxyz'.include?(characters[index])
      characters[index] = characters[index].upcase
    elsif 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(characters[index])
      characters[index] = characters[index].downcase
    end
    index += 1
  end
  characters.join
end

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
