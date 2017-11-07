require 'rubygems'
require 'gosu'
require_relative 'library/weapons_manifest'
require_relative 'library/z_order'
require_relative 'library/utilities' 
require_relative 'library/star'
require_relative 'library/ship'

class Galigoo < Gosu::Window 
  def initialize
    super 640, 480
    self.caption = "Galigoo"
    @background = Gosu::Image.new('media_files/background.png')
    @star_animation = Gosu::Image::load_tiles(self, "media_files/star.png", 25 , 25, false)
    @ship = Ship.new(self)
    @sounds = []
    start_game
  end
  
  def start_game
    @base_speed = 0.5
    @stars = []
  end

  def play_sound(sound, frequency = 1.0, volume = 1.0)
    @sounds << sound.play(frequency, volume)
  end

  def update
    @ship.update
    @stars.each do |star|
      star.update
    end
    populate_stars
    check_collisions
  end

  def check_collisions
    destroyed = []
    @stars.each do |star|
      if @ship.collide?(star)
        destroyed << star
      end
    end
    destroyed.each do |star|
      star.destroy
    end
  end

  def remove_star(star)
    @stars.delete(star)
  end
  
  def populate_stars
    @base_speed = 0.5
    max_speed = 10
    max_stars = 12
    prob = 2

    if rand(100) < prob and @stars.size < max_stars then
      @stars.push(Star.new(self, [@base_speed, max_speed].min))
    end
  end  


  def draw
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw
    @stars.each do |star|
      star.draw
    end
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