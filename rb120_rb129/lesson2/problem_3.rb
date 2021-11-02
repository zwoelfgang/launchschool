class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_name(name)
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(name)
    parse_name(name)
  end

  private

  def parse_name(name)
    names = name.split(' ')
    if names.size > 1
      self.first_name = names[0]
      self.last_name = names[1]
    else
      self.first_name = names[0]
      self.last_name = ''
    end
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'
