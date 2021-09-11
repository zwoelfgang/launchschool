ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def find_minimum(age_hash)
  value_array = age_hash.values
  counter = 0
  minimum_value = Float::INFINITY
  while counter + 1 < value_array.size
    last_value = value_array[counter]
    next_value = value_array[counter + 1]
    if next_value < minimum_value
      minimum_value = next_value
    elsif last_value < minimum_value
      minimum_value = last_value
    end
    counter += 1
  end
  age_hash.select do |key, value|
    value == minimum_value
  end
end

p find_minimum(ages)