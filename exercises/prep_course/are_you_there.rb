colors = 'blue pink yellow orange'

i = 0

loop do
  if colors.split(' ')[i] == 'yellow'
    puts 'true'
    break
  elsif colors.split(' ')[i] != 'yellow' && i < 4
    i += 1
  else
    puts 'false'
    break
  end
end

loop do
  if colors.split(' ')[i] == 'purple'
    puts 'true'
    break
  elsif colors.split(' ')[i] != 'purple' && i < 4
    i += 1
  else
    puts 'false'
    break
  end
end