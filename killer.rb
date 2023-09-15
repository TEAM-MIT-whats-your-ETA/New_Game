class Killer < Sprite
    attr_accessor :life

    def initialize(x, y, image)
        @life = 3
    end
    
    #自己位置の更新(矢印キーで操作)
    def update
        self.x += Input.x
        self.y += Input.y
    end

    #攻撃の処理
    def attack
        self.x += Input.x * 2
        self.y += Input.y * 2
        sleep(2)
    end

    #攻撃が当たった時の処理
    def shot(survivor)
        @life -= 1
    end

