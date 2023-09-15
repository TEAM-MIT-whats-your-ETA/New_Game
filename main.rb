require 'dxruby'

require_relative 'survivor'
require_relative 'killer'
require_relative 'item'
require_relative 'map'

Window.loop do
    #サバイバー,キラー,マップの表示
    survivor.draw
    killer.draw
    map.draw
    item.draw
    
    #時間設定
    timer = 60

    #描写の更新
    if 0 < timer <= 60
        survivor.update
        killer.update
        item.update
    end

    #キラーの攻撃
    if Input.mouse_push?(M_LBUTTON)
        killer.attack
    end

    


