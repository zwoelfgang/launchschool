ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

AGE = 100

def remove_above(age_hash)
  age_hash.select { |key, value| value < AGE }
end

p remove_above(ages)