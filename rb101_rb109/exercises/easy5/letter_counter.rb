def word_sizes(string)
  hash = {}
  counter = 0
  string.downcase.chars.each do |char|
    if char == ' '
      if !hash[counter]
        hash[counter] = 0
      end
      hash[counter] += 1
      counter = 0
    elsif 'abcdefghijklmnopqrstuvwxyz'.include?(char)
      counter += 1
    end
  end
  if hash[counter]
    hash[counter] += 1
  elsif counter > 0
    hash[counter] = 1
  end
  hash
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
