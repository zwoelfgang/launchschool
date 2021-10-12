def repeater(string)
  array = []
  string.chars.each do |char|
    array << char << char
  end
  array.join
end

def double_consonants(string)
  array = []
  string.chars.each do |char|
    if char =~ /[^aeiou\W0-9]/i
      array << char << char
    else
      array << char
    end
  end
  array.join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
