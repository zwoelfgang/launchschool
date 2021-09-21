arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = arr.sort do |a, b|
  a_odd = a.select { |item| item.odd? }
  b_odd = b.select { |item| item.odd? }
  a_odd <=> b_odd
end

p new_arr