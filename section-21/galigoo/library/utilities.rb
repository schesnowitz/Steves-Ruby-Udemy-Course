module Utilities

  def self.random_color(base_brightness = 40)
    color = Gosu::Color.new(need a color)
    color.red = rand(255-base_brightness) + base_brightness
    color.green = rand(255-base_brightness) + base_brightness
    color.blue = rand(255-base_brightness) + base_brightness
    color
  end


  
end