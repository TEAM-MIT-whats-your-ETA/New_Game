require 'dxruby'

$sound = Sound.new("sound/攻撃.wav")
$BGM = Sound.new("sound/雨.wav")
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
survivor = Survivor.new(20*32, 10*32, survivor_img, 3)
killer = Killer.new(9*32, 10*32, killer_img)
item_red = Item_red.new(256, 128, item_red_img)
item_blue = Item_blue.new(800, 320, item_blue_img)
item_green = Item_green.new(256, 512, item_green_img)
timer = 60 * 60
$collision = true
$item_collision = true
state = 0
$red = false
$green = false
$blue = false
$paused1 = false
$pause1_start_time = 0
$pause1_duration = 3
$paused2 = false
$pause2_start_time = 0
$pause2_duration = 3
$item_start_time = 0
$item_duration = 3
ini1 = true
ini2 = true

#fulscreen
Window.width  = 1280
Window.height = 960
Window.full_screen=(true)

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

    #自己位置の更新
    when 1
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

        #ベースマップを画面に描画
        Window.draw(0, 0, $rt_main)

        #上層マップを画面に描画
        Window.draw(0, 0, $rt_sub)

        # エスケープキーで終了
        break if Input.keyPush?(K_ESCAPE)
    
        #サバイバー,キラー,マップの表示
        survivor.draw
        killer.draw
        item_red.draw
        item_blue.draw
        item_green.draw

        #残りライフとタイマーの表示
        Window.draw_font(10, 0, "LIFE：#{survivor.life}", font)
        Window.draw_font(10, 32, "TIME：#{timer/60}sec", font)
        if $item_collision == false
            if $red
                Window.draw_font(10, 64, "ITEM：RED", font)
            elsif $blue
                Window.draw_font(10, 64, "ITEM：BLUE", font)
            else
                Window.draw_font(10, 64, "ITEM：GREEN", font)
            end
        end
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
            state = 2
        elsif timer == 59
            state = 3
        end 
    when 2
        dead_img = Image.load("images/dead_img.png")
        Window.draw(0,0,dead_img)

    when 3
        ending_img = Image.load("images/ending_img.png")
        Window.draw(0,0,ending_img)
    end
end