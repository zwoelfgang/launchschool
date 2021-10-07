nums = []

5.times do
  puts "==> Enter a number:"
  num = gets.chomp.to_i
  nums << num
end

puts "==> Enter the last number:"

last = gets.chomp.to_i

if nums.include?(last)
  puts "The number #{last} appears in #{nums}."
else
  puts "The number #{last} does not appear in #{nums}"
end
