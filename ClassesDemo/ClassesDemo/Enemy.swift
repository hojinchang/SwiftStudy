struct Enemy{
    var health: Int
    var attackStrengh: Int
    
    init(health: Int, attackStrengh: Int) {
        self.health = health
        self.attackStrengh = attackStrengh
    }
   mutating func takeDamage(amount: Int){
        health = health - amount
    }
    
    func move(){
        print("Walk forwards.")
    }
    func attack(){
        print("Land a hit, des \(attackStrengh) demage. ")
    }
}

var enemy = Enemy(health: 10, attackStrengh: 10)
print(enemy.health)
