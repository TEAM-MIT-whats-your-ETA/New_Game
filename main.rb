require 'dxruby'

require_relative 'survivor'
require_relative 'killer'
require_relative 'item'
#require_relative 'map'

#画像,フォントの呼び出し
font = Font.new(32)
survivor_img = Image.load("images/survivor_img.png")
killer_img = Image.load("images/killer_img.png")
item_red_img = Image.load("images/red.png")
item_green_img = Image.load("images/green.png")
item_blue_img = Image.load("images/blue.png")

#初期位置
survivor = Survivor.new(80, 80, survivor_img, 3)
killer = Killer.new(150, 100, killer_img)
item_red = Item_red.new(105, 105, item_red_img)
item_blue = Item_blue.new(200, 200, item_blue_img)
item_green = Item_green.new(205, 205, item_green_img)
timer = 60 * 60
collision = true

Window.loop do
    #自己位置の更新
    if timer >= 60
        timer -= 1
        survivor.update
        killer.update
    end

    #サバイバー,キラー,マップの表示
    survivor.draw
    killer.draw
    #map.draw
    item_red.draw
    item_blue.draw
    item_green.draw

    #キラーの攻撃
    if Input.mouse_push?(M_LBUTTON)
        killer.attack
    end

    #残りライフとタイマーの表示
    Window.draw_font(10, 0, "LIFE：#{survivor.life}", font)
    Window.draw_font(10, 32, "TIME：#{timer/60}sec", font) 
    
    #衝突判定
    Sprite.check(survivor, item_red)
    Sprite.check(survivor, item_blue)
    Sprite.check(survivor, item_green)
    Sprite.check(killer, survivor)
end


