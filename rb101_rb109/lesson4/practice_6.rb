flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

def shorten_names(names)
  names.map! { |item| item[0..2] }
end

shorten_names(flintstones)

p flintstones
