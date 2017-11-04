
def car_list(*cars)
  puts cars
end

# car_list("Ford", "Toyota", "Tesla", "Chevy")

def used_cars(**used_list)
  used_list.each do |make, year|
    puts "Make: #{make}"
    puts "Year: #{year}"
  end
end

this_is_data = {
  "Toyota": "1988",
  "Ford": "2005",
  "Tesla": "2016",
  "Dodge": "2001",
  "Nissan": "2011"
}

# used_cars this_is_data

def sold_cars(anything={})
  puts anything[:make]
  puts anything[:model]
  puts anything[:year]
end
sold_cars(make: "Ford", model: "A12", year: 2017)
sold_cars(make: "Chevy", model: "Chevelle", year: 1967)