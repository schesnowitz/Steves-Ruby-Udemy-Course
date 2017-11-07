module Utilities

  def self.random_color(base_brightness = 40)
    color = Gosu::Color.new(0xff_0000ff)
    color.red = rand(255-base_brightness) + base_brightness
    color.green = rand(255-base_brightness) + base_brightness
    color.blue = rand(255-base_brightness) + base_brightness
    color
  end
  
  def self.collide?(thing1, thing2)
    distance = Gosu::distance(thing1.x, thing1.y, thing2.x, thing2.y)
    distance < (thing1.radius + thing2.radius)
  end

end