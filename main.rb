require 'dxruby'

#効果音
$sound = Sound.new("sound/攻撃.wav")

#BGM
$BGM = Sound.new("sound/雨.wav")
$game_bgm = Sound.new("sound/かけっこ競争.wav")
$continue_bgm = Sound.new("sound/禁止区.wav")
$end_bgm = Sound.new("sound/エンド.wav")

require_relative 'survivor'
require_relative 'killer'
require_relative 'item'
require_relative 'map1'

map = Map.new
map.map1

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
$collision = true
$item_collision = true
state = 0
$red = false
$green = false
$blue = false
$paused = false
$pause_start_time = 0
$pause_duration = 3
$item_start_time = 0
$item_duration = 3

ini1 = true
ini2 = true
ini3 = true
ini4 = true
ini5 = true

#fulscreen
Window.width  = 1280 
Window.height = 960
#Window.full_screen=(true)

Window.loop do
    
    case state
    when 0
        if ini1
            $BGM.play
            ini1 = false
        end
            
        start_img = Image.load("images/start_img.png")
        Window.draw(0,0,start_img)
        if Input.keyPush?(K_SPACE)
            $BGM.stop
            state = 1
        end
        if Input.keyPush?(K_ESCAPE)
            
        end

    #自己位置の更新
    when 1
        if ini5
            $game_bgm.play
            ini5 = false
        end

        if ini2 
            # ベースマップをrt_mainに描画
            $rt_main.drawTile(0, 0, $map1, $mapimage, 0 ,0, 1280, 960)
            $rt_main.update

            # 上層マップをrt_subに描画
            $rt_sub.drawTile(0, 0, $map2, $mapimage, 0, 0, 1280, 960)
            $rt_sub.update

            ini2 = false
        end
        
        if timer >= 60
            timer -= 1
            survivor.update
            killer.update
        end
        #サバイバー,キラー,マップの表示
        survivor.draw
        killer.draw
        item_red.draw
        item_blue.draw
        item_green.draw


        #残りライフとタイマーの表示
        Window.draw_font(10, 0, "LIFE：#{survivor.life}", font)
        Window.draw_font(10, 32, "TIME：#{timer/60}sec", font) 
    
        #衝突判定
        if $item_collision
            Sprite.check(survivor, item_red)
            Sprite.check(survivor, item_blue)
            Sprite.check(survivor, item_green)
        end
        if $collision    
            Sprite.check(killer, survivor)
        end
        if survivor.life == 0
            $game_bgm.stop
            state = 2
        elsif timer == 59
            state = 3
        end 

    when 2
        if ini3
            $continue_bgm.play
            ini3 = false
        end

        dead_img = Image.load("images/dead_img.png")
        Window.draw(0,0,dead_img)    
    when 3
        if ini4
            $end_bgm.play
            ini4 = false
        end

        ending_img = Image.load("images/ending_img.png")
        Window.draw(0,0,ending_img)
    end
end