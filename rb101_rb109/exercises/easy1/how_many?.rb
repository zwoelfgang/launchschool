def count_occurrences(array)
  num_car = 0
  num_truck = 0
  num_motorcycle = 0
  num_SUV = 0
  hash = array.to_h do |el|
    case el
    when 'car'
      num_car += 1
      [el, num_car]
    when 'truck'
      num_truck += 1
      [el, num_truck]
    when 'motorcycle'
      num_motorcycle += 1
      [el, num_motorcycle]
    when 'SUV'
      num_SUV += 1
      [el, num_SUV]
    end
  end
  puts hash
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
