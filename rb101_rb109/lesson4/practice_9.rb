words = "the flintstones rock"

def titleize(sentence)
  array = sentence.chars
  num = 0
  loop do
    if array[num] == ' '
      array[num + 1] = array[num + 1].upcase
    elsif num == 0
      array[num] = array[num].upcase
    end
    num += 1
    break if num >= array.size
  end
  array.join
end

p titleize(words)