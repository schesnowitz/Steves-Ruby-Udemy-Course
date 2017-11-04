system 'cls'
class Car
attr_accessor :make, :model, :year, :age

  def initialize(make: make = "No make entered", model: model, year: year, age: age = 100)
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
end

car = Car.new(make: "Ford", model: "Focus", year: 2010, age: 7)
car.put_it_out

