system 'cls'

# 1. create the class
# 2. initialize the class
# 3. create getter method
# 4. create setter method

class Car
  def initialize(make)
    @make = make
  end

  def make
    @make
  end

  def make=(make)
    @make = make
  end
end

new_car = Car.new("Honda")
p new_car.make

new_car.make = "Toyota"
p new_car.make
