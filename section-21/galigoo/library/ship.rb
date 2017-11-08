class Ship

  attr_accessor :time, :x, :y

  def self.load_image_file(galigoo_window)
    @ship_image_file = Gosu::Image.new('media_files/ship.png')
  end

  def self.load_explosion_sound(galigoo_window)
    @explosion_sound_file = Gosu::Sample.new('media_files/explosion.ogg')
  end

  def initialize(galigoo_window)
    @galigoo_window = galigoo_window
    @image = self.class.load_image_file(galigoo_window)
    @explosion = self.class.load_explosion_sound(galigoo_window)
    @time = 6
    @x = galigoo_window.width / 2
    @y = galigoo_window.height / 2
    @x_offset = @image.width / 2
    @y_offset = @image.height / 2
    @lasers = []
    reset
  end

  def reset
    @exploding = false
    @x = @galigoo_window.width / 2
    @y = 400
  end

  def draw
    if @exploding
      c1 = Gosu::Color.new(0xff_ff0000)
      c1.alpha = @exploding_counter
      c1.green = (@exploding_counter / 2)
      scale = 1.5 + (((200 - @exploding_counter) / 200.0) * 0.75)
      @image.draw_rot(@x, @y, ZOrder::SHIP, 0, 0.5, 0.5, scale, scale, c1)

    elsif @spawning
      c1 = Gosu::Color.new(0xcc0099ff)
      @image.draw_rot(@x, @y, ZOrder::SHIP, 0, 0.5, 0.5, 1, 1, c1)
    else
      @image.draw_rot(@x, @y, ZOrder::SHIP, 0)
      # can be written like this
      # @lasers.each { |laser| laser.draw }

      # or like this...
      @lasers.each do |laser|
        laser.draw
      end
    end 
  end 

  def update 
    update_explosion
    update_spawning
    move
    # can be written like this
    # @lasers.each { |laser| laser.update }
    # or like this...
    @lasers.each do |hello|
      hello.update
    end
  end 

  def update_explosion
    if @exploding then
      @exploding_counter -= 1
      if @exploding_counter <= 0 then
        @exploding = false
        @galigoo_window.new_player
      end
    end
  end

  def update_spawning
    if @spawning then
      @spawning_counter = 100
      @spawning_counter -= 1
      if @spawning_counter < 0 then
        @spawning = false
      end
    end  
  end

  def spawn
    @spawning = true
    @spawning_counter = nil
    reset
  end

  def move
    return if @exploding
    if @galigoo_window.button_down? Gosu::KB_LEFT or @galigoo_window::button_down? Gosu::GP_LEFT
      move_left
    end

    if @galigoo_window.button_down? Gosu::KB_RIGHT or @galigoo_window::button_down? Gosu::GP_RIGHT
      move_right
    end

    if @galigoo_window.button_down? Gosu::KB_UP or @galigoo_window::button_down? Gosu::GP_UP
      move_up
    end

    if @galigoo_window.button_down? Gosu::KB_DOWN or @galigoo_window::button_down? Gosu::GP_DOWN
      move_down
    end
  end 

  def move_left
    if @x > 0 + @x_offset
      @x = @x - @time
    end
  end

  def move_right
    if @x < @galigoo_window.width - @x_offset
      @x = @x + @time
    end
  end 

  def move_up
    if @y > 0 + @y_offset
      @y = @y - @time
    end
  end 

  def move_down
    if @y < @galigoo_window.height - @y_offset
      @y = @y + @time
    end
  end

  def button_down(key_press)
    case key_press
  when Gosu::KbSpace
    fire_laser(SingleLaser.new(@galigoo_window, self, @x, @y)) 
  end
end

  def radius
    @radius = @image.width / 2
  end

  def destroy
    @galigoo_window.play_sound(@explosion)
    @exploding = true
    @exploding_counter = 200
  end

  def can_collide?
    !@spawning && !@exploding
  end

  def fire_laser(laser)
    @lasers << laser
    laser.fire
  end

  def remove_laser(laser)
    @lasers.delete(laser)
  end

  def collide?(thing)
    if can_collide? && Utilities.collide?(self, thing)
      self.destroy
      return true
    end
    @lasers.any? { |laser| laser.collide?(thing) }
  end

end