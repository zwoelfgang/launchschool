def star(number)
  middle_space_count = (number - 3) / 2
  edge_space_count = 0
  edge_spaces = ''
  middle_spaces = ' ' * middle_space_count
  star = '*'
  (1..number / 2).each do |num|
    puts edge_spaces + star + middle_spaces + star + middle_spaces + star
    if num == number / 2
      middle_space_count = 0
    else
      middle_space_count -= 1
    end
    edge_space_count += 1
    edge_spaces = ' ' * edge_space_count
    middle_spaces = ' ' * middle_space_count
  end
  puts star * number
  (number - 1).downto(number / 2 + 1).each do |num|
    if num == number - 1
      middle_space_count = 0
    else
      middle_space_count += 1
    end
    edge_space_count -= 1
    edge_spaces = ' ' * edge_space_count
    middle_spaces = ' ' * middle_space_count
    puts edge_spaces + star + middle_spaces + star + middle_spaces + star
  end
end

star(7)
star(9)
