class Item_red < Sprite
  def hit(survivor)
    self.vanish
    $red = true
    $item_collision = false
    $item_start_time = Time.now
  end
end

class Item_blue < Sprite
  def hit(survivor)
    self.vanish
    $blue = true
    $item_collision = false
    $item_start_time = Time.now
  end
end

class Item_green < Sprite
  def hit(survivor)
    self.vanish
    $green = true
    $pause2_start_time = Time.now
    $item_collision = false
    $item_start_time = Time.now
  end
end