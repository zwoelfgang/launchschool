puts ">> Please enter an integer greater than 0:"

integer = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."

answer = gets.chomp

if answer.downcase.start_with?('s')
  total = 0
  (1..integer).each { |num| total += num }
  puts "The sum of the integers between 1 and #{integer} is #{total}."
elsif answer.downcase.start_with?('p')
  total = 1
  (1..integer).each { |num| total *= num }
  puts "The product of the integers between 1 and #{integer} is #{total}."
end
