process_the_loop = [true, false].sample

if process_the_loop == TRUE
  loop do
    puts "The loop was processed\n"
    break
  end
elsif process_the_loop == FALSE
  loop do
    puts "The loop wasn't processed!\n"
    break
  end
end
    
