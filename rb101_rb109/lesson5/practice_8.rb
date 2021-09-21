hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []

hsh.each do |_, value|
  value.each do |array| 
    array.chars.select do |item|
      if item =~ /[aeiou]/
        vowels.push(item)
      end
    end
  end
end

p vowels