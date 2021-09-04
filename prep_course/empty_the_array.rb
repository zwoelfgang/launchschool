names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do names
  name = names.pop
  puts name
  break if names.size == 0
end
