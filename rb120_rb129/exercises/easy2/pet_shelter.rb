class Shelter
  def initialize
    @adoptions = Hash.new([])
  end

  def adopt(owner, pet)
    @adoptions[owner.name] += [pet]
    owner.pets(pet.pet_name)
  end

  def print_adoptions
    @adoptions.each do |key, value|
      puts "#{key} has adopted the following pets:"
      value.each { |pet| puts "a #{pet.animal} named #{pet.pet_name}" }
      puts ''
    end
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def pets(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.count
  end
end

class Pet
  attr_reader :pet_name, :animal

  def initialize(animal, name)
    @animal = animal
    @pet_name = name
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
