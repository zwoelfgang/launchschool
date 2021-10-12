def penultimate(string)
  string.split[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
