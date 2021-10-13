require 'yaml'

TEXT = YAML.load_file('text.yml')

def longest_sentence(file)
  array = []
  sentences = file.split(/[!.?]/)
  words = sentences.map do |sentence|
    array << sentence.split(' ').count
    sentence.split(' ')
  end
  puts words.sort_by { |el| el.size }[-1].join(' ')
  puts array.sort[-1]
end

longest_sentence(TEXT)
