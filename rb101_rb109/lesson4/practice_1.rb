flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def to_hash_positional(array)
  array.to_h { |item| [item, array.index(item)] }
end

p to_hash_positional(flintstones)
