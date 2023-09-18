class Killer < Sprite
    

    #自己位置の更新(矢印キーで操作)
    def update
        if $paused
            if (Time.now - $pause_start_time) > $pause_duration
                $paused = false
                $collision = true
            end
        else 
            self.x += Input.x
            self.y += Input.y
        end
    end

    #攻撃の処理
    def attack
        self.x += Input.x * 20
        self.y += Input.y * 20
    end

    def shot(survivor)
        $paused = true
        $pause_start_time = Time.now
        $collision = false
    end
    
end
