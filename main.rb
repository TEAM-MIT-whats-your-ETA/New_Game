require 'dxruby'

require_relative 'survivor'
require_relative 'killer'
require_relative 'item'
#require_relative 'map'

#画像,フォントの呼び出し
font = Font.new(32)
survivor_img = Image.load("images/survivor_img.png")
=begin
survivor_red_img = Image.load("images/red.png")
survivor_green_img = Image.load("images/green.png")
survivor_blue_img = Image.load("images/blue.png")
=end
killer_img = Image.load("images/killer_img.png")
item_red_img = Image.load("images/red.png")
item_green_img = Image.load("images/green.png")
item_blue_img = Image.load("images/blue.png")

#初期位置
survivor = Survivor.new(100, 100, survivor_img)
killer = Killer.new(150, 100, killer_img)
timer = 60 * 60

Window.loop do
    #時間設定
    

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
    #item.draw

    #キラーの攻撃
    if Input.mouse_push?(M_LBUTTON)
        killer.attack
    end

    #残りライフとタイマーの表示
    #Window.draw_font(10, 0, "LIFE：#{survivor.life}}", font)
    Window.draw_font(10, 32, "TIME：#{timer/60}sec", font) 
    
    #衝突判定
=begin
    Sprite.check(survivor, item.red)
    Sprite.check(survivor, item.blue)
    Sprite.check(survivor, item.green)
=end    
    Sprite.check(survivor, killer)
end





