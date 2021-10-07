puts "Please write a word or multiple words:"

answer = gets.chomp

characters = answer.chars.reject { |char| char == ' ' }.count

puts "There are #{characters} characters in \"#{answer}\"."