class Star

  TILE_WIDTH = 25
  TILE_HEIGHT = 25

  attr_accessor :height, :width, :x, :y, :size

  def self.load_animation(galigoo_window)
    @animation = Gosu::Image::load_tiles(galigoo_window, 'media_files/star.png', TILE_WIDTH, TILE_HEIGHT, false)
  end

  def self.load_sound(galigoo_window)
    @sound = Gosu::Sample.new('media_files/beep.wav')
  end

  def initialize(galigoo_window, speed = 0.5)
    @galigoo_window = galigoo_window
    @star_animation = self.class.load_animation(galigoo_window)
    @x = rand(galigoo_window.width - TILE_WIDTH)
    @y = 0
    @size = rand(3) + 1
    @height = TILE_HEIGHT * @size
    @width = TILE_WIDTH * @size
    @beep = self.class.load_sound(galigoo_window)
    @color = Utilities::random_color
    @speed = speed
  end

  # def draw
  #   image = @star_animation[(Gosu::milliseconds / 100) % @star_animation.size]
  #   image.draw_rot(@x, @y, ZOrder::STAR, -90, 0.5, 0.5, @size, @size, @color)
  # end

  # def update
  #   @y = @y + @speed
  #   if (@y - height) > @galigoo_window.height
  #     @galigoo_window.remove_star(self)
  #   end
  # end  

  def draw
    img = @staranim[(Gosu::milliseconds / 100) % @staranim.size]
    img.draw_rot(@x, @y, ZOrder::STAR, -90, 0.5, 0.5, @size, @size, @color)
  end

  def update
    @y += @speed
    if (@y - height) > @galigoo_galigoo_window.height
      @galigoo_galigoo_window.remove_star(self)
    end
  end

  def radius
    (19.0 * @size) / 2.0
  end
end