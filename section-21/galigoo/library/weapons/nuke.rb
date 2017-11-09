class Nuke < BaseLaser

  def self.load_image(galigoo_window)
    @nuke_image_file = Gosu::Image.new("media_files/shield.png")
  end

  def initialize(galigoo_window, ship, x, y)
    super
    @size = 0.5
    @image = self.class.load_image(galigoo_window)
    @angle = 0.0
    @laser_sound_frequency = 0.4
    @laser_volume = 0.3
  end


  def draw
    @image.draw_rot(@x, @y, ZOrder::LASER, @angle, 0.5, 0.5, @size, @size, 0xff_ff00ff)
  end 

  def update
    # @angle -= 5
    @angle = (@angle - 5)
    # @size *= 1.05
    @size = @size * 1.05
    if (@size * 20) > @galigoo_window.width then
      @ship.remove_laser(self)
  end
end

  def radius
    @size * 60
  end 

  def collide?(thing)
    Utilities.collide?(self, thing)
  end

end