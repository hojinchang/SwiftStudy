protocol canFly {
    func fly()
    
}

class Bird {
    
    var isFemale = true
    
    func layEgg(){
        if isFemale{
            print("the brd makes a new bird in a shell")
        }
    }
}

class Eagle: Bird, canFly {
    func fly() {
        print("the Eagel flaps its wings and lifts off into the sky")
    }
    
    
    func soar(){
        print("The eagle glides in the air using air currents")
    }
    
}

class Penguin: Bird {
    func swim(){
        print("The penguin paddles through the water")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: canFly) {
        flyingObject.fly()
    }
}

struct AirPlane: canFly{
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

var myEagle = Eagle()

let myPenguin = Penguin()

let myPlane = AirPlane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
