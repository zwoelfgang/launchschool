module Haulable
  attr_accessor :towing_capacity

  def get_towing_capacity
    puts "This baby can haul #{towing_capacity} lbs!"
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year

  @@count = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@count += 1
  end

  def get_age
    puts "The #{@model} is #{age} years old"
  end

  def speed_up(n)
    @speed += n
    puts "You are now going at #{@speed} mph"
  end

  def brake(n)
    @speed -= n
    puts "You are now going at #{@speed} mph"
  end

  def shut_off
    @speed = 0
    puts "You are now going at #{@speed} mph"
  end

  def spray_paint(c)
    self.color = c
  end

  def self.mileage(miles, gallon)
    @@mpg = miles / gallon
  end

  def self.number_of_objects
    puts "There are currently #{@@count} vehicles"
  end

  private

  def age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  VEHICLE = 'car'

  def to_s
    puts "This #{VEHICLE} is a #{self.color} #{self.year} #{@model} going #{@speed} mph at #{@@mpg} miles/gallon."
  end
end

class MyTruck < Vehicle
  include Haulable

  VEHICLE = 'truck'

  def to_s
    puts "This #{VEHICLE} is a #{self.color} #{self.year} #{@model} going #{@speed} mph at #{@@mpg} miles/gallon."
  end
end

new_car = MyCar.new(1998, 'white', 'Forester')
new_car.speed_up(20)
new_car.speed_up(20)
new_car.brake(20)
new_car.brake(20)
new_car.shut_off
new_car.spray_paint('blue')
new_car.color
MyCar.mileage(351, 13)
puts new_car

new_truck = MyTruck.new(2020, 'gray', 'Tacoma')
new_truck.speed_up(20)
new_truck.speed_up(20)
new_truck.brake(20)
new_truck.spray_paint('blue')
new_truck.color
MyTruck.mileage(351, 13)
puts new_truck

Vehicle.number_of_objects

new_truck.towing_capacity = 500
new_truck.get_towing_capacity

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

new_car.get_age
puts Vehicle.age