def greetings(array, hash)
  puts "Hello #{array.join(' ')}, nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
