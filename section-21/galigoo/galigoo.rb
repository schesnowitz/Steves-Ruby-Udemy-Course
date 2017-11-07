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
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @ship = Ship.new(self)
    @sounds = []
    start_game
  end

  def current_level
    (@score / 1000) + 1
  end
  
  def start_game
    @base_speed = 0.5
    @stars = []
    @score = 0
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
        @score += (10 * (3.0 / star.size)).to_i
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
    @base_speed = ((current_level - 1) * 0.2) + 0.5
    max_speed = 10
    max_stars = 12 + (current_level * 2)
    prob = 2 + (current_level * 0.5 )

    if rand(100) < prob and @stars.size < max_stars then
      @stars.push(Star.new(self, [@base_speed, max_speed].min))
    end
  end  


  def draw
    
    @ship.draw
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @stars.each do |star|
      star.draw
    end
    draw_game_ui
  end

    def draw_game_ui
      @font.draw("Score: #{@score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
      
      text_width = @font.text_width("Level: #{current_level}")
      @font.draw("Level: #{current_level}", (width - 20 - text_width), 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
  
    end
  
    def draw_text(text, x, y)
      text_width = @font.text_width(text)
      text_height = @font.height
      @font.draw(text, (x - w / 2), (y - text_height / 2), ZOrder::UI, 1.0, 1.0, 0xffffff00)
  
  
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