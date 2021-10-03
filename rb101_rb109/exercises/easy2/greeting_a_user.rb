puts "What is your name?"

name = gets.chomp.chars

if name[-1] == '!'
  puts "HELLO #{name[0..-2].join.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.join}."
end
