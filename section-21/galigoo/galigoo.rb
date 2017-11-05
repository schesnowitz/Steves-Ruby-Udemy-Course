require 'rubygems'
require 'gosu'
require_relative 'library/weapons_manifest'
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

  def button_down(id)
    case id
      when Gosu::KbQ, Gosu::KbEscape
        close
      else
        @ship.button_down(id)
      end
  end
end

galigoo_window = Galigoo.new
galigoo_window.show