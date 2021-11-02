class Person
  def name=(name)
    @name = name
  end

  def name
    @name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
