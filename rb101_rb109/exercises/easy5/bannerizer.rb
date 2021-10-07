def print_in_box(string)
  top_bottom_dash = ''
  top_bottom_space = ''
  string.chars.count.times do
    top_bottom_dash += '-'
    top_bottom_space += ' '
  end
  puts "+-#{top_bottom_dash}-+"
  puts "| #{top_bottom_space} |"
  puts "| #{string} |"
  puts "| #{top_bottom_space} |"
  puts "+-#{top_bottom_dash}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
