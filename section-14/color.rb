system 'cls'
class Car
attr_accessor :make, :model, :year, :age

  def initialize(make: make = "No make entered", model: model, year: year, age: age)
    @make = make
    @model = model
    @year = year
    @age = age
  end

  def put_it_out
    puts @make
    puts @model
    puts @year
    puts @age
  end

  def get_the_year
    @current_time = Time.now.strftime('%Y').to_i
    @car_year_neg = @current_time - @year   
    @car_year = @car_year_neg 
    puts "This car is #{@car_year} years old"
  end
end

car = Car.new(
  make: "Ford", model: "Focus", year: 2010)
# car.put_it_out
# car.get_the_year

class Color < Car

  def color
    return "Red"
  end
end


color = Color.new(
  make: "Ford", model: "Focus", year: 2010)

puts color.put_it_out
puts color.color


