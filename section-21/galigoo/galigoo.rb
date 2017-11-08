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
    @life_image = Ship.load_image_file(self)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 25)
    @ship = Ship.new(self)
    @sounds = []
    start_game
  end

  def current_level
    (@score / 1000) + 1
  end
  
  def start_game
    @paused = false
    @game_over = false
    @life_counter = 3
    @base_speed = 0.5
    @stars = []
    @score = 0
    @ship.reset
  end

  def new_player
    if @life_counter > 0 then
      @life_counter -= 1
      @ship.spawn
    else
      @game_over = true
  end
end

 def toggle_paused
  if @paused
    resume_sounds
  else
    pause_sounds
  end
  @paused = !@paused
 end

  def play_sound(sound, frequency = 1.0, volume = 1.0)
    @sounds << sound.play(frequency, volume)
  end

  def clear_stopped_sounds
    @sounds.reject! { |sound| @sound.playing? && !sound.paused? }
  end 

  def pause_sounds
    @sounds.each { |sound| sound.pause if sound.playing? }
  end  

  def resume_sounds
    @sounds.each { |sound| sound.resume if sound.paused? }
  end

  def update
    unless @paused || @game_over
    @ship.update
    @stars.each do |star|
      star.update
    end
    populate_stars
    check_collisions
  end
end

  def check_collisions
    destroyed = []
    @stars.each do |star|
      if @ship.collide?(star)
        @score += (10 * (3.0 / star.size)).to_i
        destroyed << star    
      end
    end

    destroyed.each do |star|
      star.destroy
    end
  end

  
  def populate_stars
    @base_speed = ((current_level - 1) * 0.2) + 0.5
    max_speed = 10
    max_stars = 12 + (current_level * 2)
    prob = 2 + (current_level * 0.5)

    if rand(100) < prob and @stars.size < max_stars then
      @stars.push(Star.new(self, [@base_speed, max_speed].min))
    end
  end  

  def remove_star(star)
    @stars.delete(star)
  end

  def draw
    draw_game_ui
    @background.draw(0, 0, ZOrder::BACKGROUND)
    @ship.draw
    @stars.each do |star|
      star.draw
      @ship.draw unless @game_over
    end
  end


  def draw_game_ui
    @font.draw("Galigoo Score: #{@score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)

    text_width = @font.text_width("Level: #{current_level}")
    @font.draw("Level: #{current_level}", (width - 20 - text_width), 10, ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
    draw_life_counter
    draw_pause_screen if @paused
    draw_game_over_screen if @game_over
  end


  def draw_pause_screen
    draw_text("Paused", 310, 240)
    draw_text("ESC - Quit", 310, 280)
    draw_text("Space/Alt/Ctrl - Fire Weapons", 310, 300 )
    draw_text("N - Nuke", 310, 340)
  end

  def draw_game_over_screen
    draw_text("GAME OVER", 310, 240)
    draw_text("Press Enter to Play Again", 310, 280)
  end 

  def draw_life_counter
    if @life_counter > 0
      # draw number of ships left to play
      @life_counter.times do |times|
        @life_image.draw_rot(20 + (times * 28), (height - 20), ZOrder::UI, 0, 0.5, 0.5, factor_x=0.4, factor_y=0.4)
      end 

      # drawing box around ships
      draw_line(0, (height - 40), 0xff_00ffff, 10 + (@life_counter * 28), (height - 40), 0xff_00ffff, ZOrder::UI)

      draw_line(10 + (@life_counter * 28), height, 0xff_00ffff, 10 + (@life_counter * 28), (height - 40), 0xff_00ffff, ZOrder::UI)
  end
end


  def draw_text(text, x, y)
    text_width = @font.text_width(text)
    @font.text_width("Level: #{current_level}")
    text_height = @font.height
    @font.draw(text, (x - text_width / 2), (y - text_height / 2), ZOrder::UI, 1.0, 1.0, 0xff_00ffff)
  end
  

  def button_down(id)
    if @game_over then
      if id == Gosu::KbEnter or id == Gosu::KbReturn
        self.start_game
      end 
    else
    case id
    when Gosu::KbP 
      toggle_paused
      when Gosu::KbQ, Gosu::KbEscape
        close
      else
        @ship.button_down(id)
      end
    end
  end
end



galigoo_window = Galigoo.new
galigoo_window.show