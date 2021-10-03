def reverse_sentence(string)
  reversed_sentence = string.split.reverse.join(" ")
end

def reverse_words(string)
  reversed_words = string.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end
  reversed_sentence = reversed_words.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
