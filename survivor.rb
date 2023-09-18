class Survivor < Sprite
    attr_accessor :life
    def initialize(x, y, image, life) # 追加
        @life = 3
        super
    end

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

    def hit(killer)
        @life -= 1
        if @life == 0
            self.vanish
        end
        collision = false
        return collision
    end

end