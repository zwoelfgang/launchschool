statement = "The Flintstones Rock"

ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "

def word_count_hash(sentence)
  num = 0
  word_count = {}
  loop do
    word_count[ALPHABET[num]] = sentence.count(ALPHABET[num]) if sentence.count(ALPHABET[num]) > 0
    num += 1
    break if num >= ALPHABET.size
  end
  word_count
end

p word_count_hash(statement)