class Ship

  def self.load_image_file(galigoo_window)
    @ship_image_file = Gosu::Image.new('media_files/ship.png')
  end

  def initialize(galigoo_window)
    @galigoo_window = galigoo_window
    @image = self.class.load_image_file(galigoo_window)
    @time = 6
    @x = galigoo_window.width / 2
    @y = galigoo_window.height / 2
    @x_offset = @image.width / 2
    @y_offset = @image.height / 2

  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end 

  def update 
    move
  end 

  def move
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


end