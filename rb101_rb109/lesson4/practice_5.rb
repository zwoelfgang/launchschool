flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

def return_index_Be(names)
  location = nil
  names.each_with_index do |item, index|
    if item[0..1] == 'Be'
      location = index
      break
    end
  end
  location
end

p return_index_Be(flintstones)