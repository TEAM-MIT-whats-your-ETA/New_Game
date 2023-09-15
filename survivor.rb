class Survivor < Sprite
    def update
        #Wキーで上に移動
        if Input.key_down?(K_W)
            self.y -= 1
        end

        #Sキーで下に移動
        if Input.key_down?(K_S)
            self.y += 1
        end

        #Aキーで左に移動
        if Input.key_down?(K_A)
            self.x -= 1
        end

        #Dキーで右に移動
        if Input.key_down?(K_D)
            self.x += 1
        end
    end

    #プレイヤー画像を一定時間赤色に入れ替える
    def hit(item_red)

        #効果時間の設定
        timer = 180

        loop do
            timer -= 1

            if timer == 179
                self.image = survivor_red_img
            elsif timer == 0
                self.image = survivor_img
            end

            break if timer <= 0
        end
    end
    #プレイヤー画像を一定時間青色に入れ替える
    def hit(item_blue)
        
        #効果時間の設定
        timer = 180
        
        loop do
            timer -= 1

            if timer == 179
                self.image = survivor_blue_img
            elsif timer == 0
                self.image = survivor_img
            end

            break if timer <= 0
        end
    end

    #プレイヤー画像を一定時間緑色に入れ替える
    def hit(item_green)
        
        #効果時間の設定
        timer = 180
        
        loop do
            timer -= 1

            if timer == 179
                self.image = survivor_green_img
            elsif timer == 0
                self.image = survivor_img
            end

            break if timer <= 0
        end
    end
end