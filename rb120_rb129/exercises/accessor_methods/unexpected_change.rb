class Person
  def name=(name)
    @full_name = name.split(' ')
  end

  def name
    @full_name[0] + ' ' + @full_name[1]
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name