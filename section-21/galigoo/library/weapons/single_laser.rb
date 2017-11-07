class SingleLaser < BaseLaser
  def collide?(thing)
    if super
      @ship.remove_laser(self)
      true
    end
  end
end