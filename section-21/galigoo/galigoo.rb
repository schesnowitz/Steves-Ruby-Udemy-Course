require 'rubygems'
require 'gosu'
require_relative 'library/z_order'
require_relative 'library/ship'

class Galigoo < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Galigoo"
    @background = Gosu::Image.new('media_files/background.png')
    @ship = Ship.new(self)
  end
  
  def update
    @ship.update
  end
  
  def draw
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw
  end
end

galigoo_window = Galigoo.new
galigoo_window.show