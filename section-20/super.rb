# The super keyword can be used to call a method of the same name in the superclass of the class making the call.

system 'cls'

class Car
  def color
    %q{Red}
  end

  def door_type
    %q{2 Door}
  end

  def wheel_type
    %{sport}
  end
end

class Truck < Car
  def color
    super + %q{ Green} 
    # %q{Green}
  end
end

# car = Car.new
# puts car.door_type

truck = Truck.new
puts truck.color
