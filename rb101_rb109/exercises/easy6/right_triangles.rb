def triangle(integer)
  integer.times do |num|
    stars = "#{'*' * (num + 1)}"
    spaces = "#{' ' * ((num + 1) - integer).abs}"
    puts spaces + stars
    num += 1
  end
end

triangle(5)
triangle(9)
