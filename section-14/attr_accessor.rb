system 'cls'
class Car
attr_accessor :make

  def initialize(make)
    @make = make
  end
end

new_car = Car.new("Honda")
p new_car.make

new_car.make = "Toyota"
p new_car.make
