def center_of(string)
  center = string.size / 2
  if string.size.odd?
    string[center]
  else
    string[center - 1..center]
  end
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
