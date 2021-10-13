def diamond(number)
  stars = '*'
  spaces = ' ' * ((number - stars.length) / 2)
  count = 0
  while count < number - 1
    if count.even?
      puts spaces + stars
      count += 1
      stars = '*' * (count + 2)
      spaces = ' ' * ((stars.length - number) / 2).abs
    else
      count += 1
    end
  end
  puts '*' * number
  while count > 0
    if count.odd?
      count -= 1
      stars = '*' * (count + 1)
      spaces = ' ' * ((stars.length - number) / 2).abs
      puts spaces + stars
    else
      count -= 1
    end
  end
end

diamond(1)
diamond(3)
diamond(9)
