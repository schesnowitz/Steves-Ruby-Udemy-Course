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
    @star_animation = Gosu::Image::load_tiles(self, "media_files/star.png", 25 , 25, false)
    @ship = Ship.new(self)
    @sounds = []
  end
  

  def play_laser(sound, frequency = 1.0, volume = 1.0)
    @sounds << sound.play(frequency, volume)
  end

  def update
    @ship.update
  end
  
  def draw
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw

    @star_animation.each_with_index do |tile, i|
      tile.draw(100 + (40 * i), 50, ZOrder::STAR)
    end
    image = @star_animation[(Gosu::milliseconds / 100) % @star_animation.size]
    image.draw(100, 220, ZOrder::STAR)
    image.draw(100, 220, ZOrder::STAR, 2.0, 2.0, 0xff_ff0000)
    image.draw_rot(100, 340, ZOrder::STAR, -90, 0.5, 0.5, 3.0, 3.0, 0xff_00ffff)

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