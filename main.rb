require 'dxruby'

require_relative 'survivor'
require_relative 'killer'
require_relative 'item'
require_relative 'map'

font = Font.new(32)
survivor_img = Image.load("image/survivor.png")
killer_img = Image.load("image/killer.png")

Window.loop do
    #時間設定
    timer = 60 * 60

    #自己位置の更新
    if timer >= 60
        timer -= 1
        survivor.update
        killer.update
    end

    #サバイバー,キラー,マップの表示
    survivor.draw
    killer.draw
    map.draw
    item.draw

    #キラーの攻撃
    if Input.mouse_push?(M_LBUTTON)
        killer.attack
    end

    #残りライフとタイマーの表示
    Window.draw_font(10, 0, "LIFE：#{survivor.life}}", font)
    Window.draw_font(10, 32, "TIME：#{timer/60}sec", font) 
    
    #衝突判定
    Sprite.check(survivor, map)
    Sprite.check(killer, map)
    Sprite.check(survivor, item)
end





