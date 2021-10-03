year = Time.now.year

puts "What is your age?"

age = gets.chomp.to_i

puts "At what age would you like to retire?"

retirement_age = gets.chomp.to_i
retirement_years = retirement_age - age

puts "It's #{year}. You will retire in #{year + retirement_years}"
puts "You have only #{retirement_years} years of work to go!"
