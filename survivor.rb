class Survivor < Sprite
    attr_accessor :life
    def initialize(x, y, image, life) # 追加
        @life = 3
        super
    end

    def update
        if $red || $green || $blue
            if (Time.now - $item_start_time) >= $item_duration
                $red = false
                $green = false
                $blue = false
                $collision = true
                $item_collision = true
            end
        end
        
        if $green
            if (Time.now - $pause2_start_time) >= $pause2_duration
                $paused2 = false
            end
        
        elsif $red
            #Wキーで上に移動
            if Input.key_down?(K_W)
                tmp1 = $map1[((self.y - 2 + 9) / 32)][((self.x + 9) / 32)]
                tmp2 = $map2[((self.y - 2 + 9) / 32)][((self.x + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.y -= 2
                end
            end
    
            #Sキーで下に移動
            if Input.key_down?(K_S)
                tmp1 = $map1[((self.y + 2 + 9) / 32)][((self.x + 9) / 32)]
                tmp2 = $map2[((self.y + 2 + 9) / 32)][((self.x + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.y += 2
                end
            end
    
            #Aキーで左に移動
            if Input.key_down?(K_A)
                tmp1 = $map1[((self.y + 9) / 32)][((self.x - 2 + 9) / 32)]
                tmp2 = $map2[((self.y + 9) / 32)][((self.x - 2 + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.x -= 2
                end
            end
    
            #Dキーで右に移動
            if Input.key_down?(K_D)
                tmp1 = $map1[((self.y + 9) / 32)][((self.x + 2 + 9) / 32)]
                tmp2 = $map2[((self.y + 9) / 32)][((self.x + 2 + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.x += 2
                end
            end
        elsif $blue
            $collision = false
        
        else
            if Input.key_down?(K_W)
                tmp1 = $map1[((self.y - 1 + 9) / 32)][((self.x + 9) / 32)]
                tmp2 = $map2[((self.y - 1 + 9) / 32)][((self.x + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.y -= 1
                end
                
            end
    
            #Sキーで下に移動
            if Input.key_down?(K_S)
                tmp1 = $map1[((self.y + 1 + 9) / 32)][((self.x + 9) / 32)]
                tmp2 = $map2[((self.y + 1 + 9) / 32)][((self.x + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.y += 1
                end
            end
    
            #Aキーで左に移動
            if Input.key_down?(K_A)
                tmp1 = $map1[((self.y + 9) / 32)][((self.x - 1 + 9) / 32)]
                tmp2 = $map2[((self.y + 9) / 32)][((self.x - 1 + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.x -= 1
                end
            end
    
            #Dキーで右に移動
            if Input.key_down?(K_D)
                tmp1 = $map1[((self.y + 9) / 32)][((self.x + 1 + 9) / 32)]
                tmp2 = $map2[((self.y + 9) / 32)][((self.x + 1 + 9) / 32)]
                if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                    self.x += 1
                end
            end
        end
    end

    def hit(killer)
        if $blue == false
            @life -= 1
        end
        if @life == 0
            self.vanish
        end
    end

end