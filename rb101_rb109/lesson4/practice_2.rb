ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def add_ages(age_hash)
  number = 0
  age_hash.each { |key, value| number += value }
  number
end

p add_ages(ages)
