struct MyOptional {
    var property = 123
    func method(){
        print("I am the struct method.")
    }
}

let myOptional: MyOptional?

myOptional = MyOptional()
myOptional?.method()

