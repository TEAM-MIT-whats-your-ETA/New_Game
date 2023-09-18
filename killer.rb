class Killer < Sprite
    

    #自己位置の更新(矢印キーで操作)
    def update
        if $paused1
            if (Time.now - $pause1_start_time) > $pause1_duration
                $paused1 = false
                $collision = true
            end
        else 
            #ここで衝突判定
            tmp1 = $map1[((self.y + Input.y + 9) / 32)][((self.x + Input.x + 9) / 32)]
            tmp2 = $map2[((self.y + Input.y + 9) / 32)][((self.x + Input.x + 9) / 32)]
            if ((tmp1 == 1 || tmp1 == 5) && tmp2 == nil)   #境界且つ壁かどうか判定
                self.x += Input.x
                self.y += Input.y
            end
        end
    end

    def shot(survivor)
        $sound.play
        $paused1 = true
        $pause1_start_time = Time.now
        $collision = false
    end
    
end
