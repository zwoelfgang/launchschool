munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def add_age_group(hash)
  hash.each do |key, value|
    if hash.fetch(key).fetch("age") >= 65
      hash[key].update({"age_group" => "senior"})
    elsif hash.fetch(key).fetch("age") < 18
      hash[key].update({"age_group" => "kid"})
    else
      hash[key].update({"age_group" => "adult"})
    end
  end
end

p add_age_group(munsters)