puts "Enter the length of the room in meters:"

length = gets.chomp.to_f

puts "Enter the width of the room in meters:"

width = gets.chomp.to_f

square_meters = length * width
square_feet = square_meters * 10.7639

puts "The area of the room is #{square_meters.round(2)} square meters (#{square_feet.round(2)} square feet)."
