puts "What is the bill?"

bill = gets.chomp.to_f

puts "What is the tip percentage?"

tip_percentage = gets.chomp.to_f

tip = bill * (tip_percentage / 100)
bill += tip

puts "The tip is $#{tip}"
puts "The total is $#{bill}"
