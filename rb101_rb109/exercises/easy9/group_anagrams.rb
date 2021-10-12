def group_anagrams(array)
  count = 0
  return_array = []
  count_array = array.map{ |word| word.chars.sort.join }.uniq
  count_array.count.times do
    return_array << []
    count += 1
  end
  count.times do |index|
    array.each do |word|
      return_array[index] << word if count_array[index] == word.chars.sort.join
    end
  end
  return_array
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams(words)
