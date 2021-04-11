import Cocoa

// guard let
func greet(person: [String: String]){
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        return
    }
    print("Hello \(location)")
    
    if let name = person["name"]{
        
    } else {
        
    }
}

greet(person: ["name": "Johnn", "location": "seoul"])
//guard let if let optional binding

func fullName(name: String, rawPrefix: String?){
      if let prefix = rawPrefix {
          print(prefix+name)
      } else {
          print("prefix need")
      }
    //guard let
    guard let prefix = rawPrefix else {
        print("prefix need")
        return
    }
    print(prefix+name)
}
fullName(name: "dohyun", rawPrefix: "chung")
fullName(name: "dohyun", rawPrefix: nil)


//guard let은 guard let 뒤에 따라 붙는 코드의 실행 결과가 true일때 코드를 진행한다. if 문과 다르게 guard 구문은 항상 else 구문이 뒤에 따라와야한다.
// guard 뒤에 따라오는 bool 값이 false면 else블록 실행하고, 상위 블록코드를종료하는 return, break continue, throw가 필요하다.

// 보통 예외사항만을 처리하고 싶다면 guard 구문을 사용하는 것이 편하다.
func isItString(string: String?){
    guard string != nil else{
        print("nil")
        return
    }
    print(string)
}
isItString(string: "dohyun")
isItString(string: nil)
// 하지만 return break continue throw 등을 사용 못하면 불가능하다. -> 함수, 메서드, 반복문 내에서 사용이 용이하다.
// 즉, 함수일 경우 return, loop일 경우 break,continue, error를 throw 가능
// loop 빠져나오기
func guardControlFlow() {
    let strings: [String] = ["hi", "dohyun", "findout", "guardlet"]
    for string in strings{
        guard string != "guardlet" else {
            continue
            // string이 guardlet일때는 아래 수행 아니면 걍 다 재끼고 다시 포문 돌리기
        }
        print(string)
    }
}
guardControlFlow()

//Error throw

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item{
    var price: Int
    var count: Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar" : Item(price:12, count: 7),
        "Chips" : Item(price: 10 , count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinDeposited)
        }
    }
}

// guard let의 새로 생긴 변수는 guardlet 이후의 상위 블록에서 지역 상수처럼 사용가능하다.
func guardletF (string: String?){
    guard let string = string else {
        return
    }
    print("string is \(string)")
}
guardletF(string: "test")
// if let은 { } 안에서만 사용해야한다는 단점이 있음


// guardlet으로 옵셔널 바인딩을 할때, 여러개를 같이 할 수 있다는 장점이 있다.
func manyGuardLet(first: String?, second: String?, third: String?){
    guard let first = first, let second = second, let third = third else {
        return
    }
    print("first is \(first), second is \(second), third \(third)")
}
manyGuardLet(first: "one", second: "two", third: "three")
manyGuardLet(first: nil, second: "two", third: "three")
manyGuardLet(first: "one", second: nil, third: "three")
manyGuardLet(first: "one", second: "two", third: nil)






