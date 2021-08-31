count = 1

loop do
  if count % 2 == 1 then puts "#{count} is odd!"
  elsif count % 2 == 0 then puts "#{count} is even!" end
  
  count += 1
  break if count > 5
end
