import Cocoa




//옵셔널 체이닝
// 옵셔널의 내부의 내부의 내부로 옵셔널이 연결되어있을때 활용 가능하다.
// 옵셔널 언래핑보다는 인스턴스의 옵셔널 프로퍼티 내부 프로퍼티에 접근할 때 쓴다.

// 매번 if let 혹은 guard let 문을 활용하지 않고 옵셔널을 깔 수있다.

class Person {
    // 평소에 클래스에 있어도 되고 없어도 된다면, 저장 프로퍼티를 옵셔널로 선언할 수 있다.
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var guardian: Person?
    var owner: Person?
    
    init(bnum: String, rnum: String) {
        buildingNumber = bnum
        roomNumber = rnum
    }
}

let dohyun: Person? = Person(name: "dohyun")
let home: Apartment? = Apartment(bnum: "101", rnum: "202")
let superman: Person?  = Person(name: "superman")

// 지금 클래스 안에 옵셔널 변수에는 아무것도 초기화를 해주지 않았기 때문에 클래스 내 옵셔널 변수에는 다 nil 값이 있다.

// 옵셔널 체이닝이 실행 후 결과 값이 nil일 수 있기 떄문에, 결과 타입도 옵셔널이다.

func guardianJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let guardian = home.guardian {
                if let job = guardian.job {
                    print("guardian's job \(job)")
                } else {
                    print("no job")
                }
            }
            else {
                print("we don't have guardian")
            }
        }
        else {
            print("no home")
        }
    } else {
        print("no owner")
    }
}

guardianJob(owner: dohyun)


// 옵셔널 체이닝 사용

func guardianJobWithOptionalChaining(owner: Person?){
    if let guardianJob = owner?.home?.guardian?.job{
        print("guardian's job \(guardianJob)")
    } else {
        print("no guardian")
    }
}

guardianJobWithOptionalChaining(owner: dohyun)

dohyun?.home?.guardian?.job
dohyun?.home = home
dohyun?.home?.guardian
dohyun?.home?.guardian = superman
dohyun?.home?.guardian?.name

dohyun?.home?.guardian?.job
dohyun?.home?.guardian?.job = "대장"
print(dohyun?.home?.guardian?.job)

//MARK: - nil coalescing

// nil 병합 연산자
// 중위 연산자
// optional ?? default value
// 옵셔널 값이 nil일 경우, 우측의 값을 반환
// 띄어쓰기 주의 필요

var guardJob: String
guardJob = dohyun?.home?.guardian?.job ?? "batman"
print(guardJob)

dohyun?.home?.guardian?.job = nil
guardJob = dohyun?.home?.guardian?.job ?? "batman"
print(guardJob)

//MARK: - optional chaining with method

struct myOptional {
    var property = 123
    func method() {
        print("struct's method")
    }
}

let myOptionalstruct: myOptional?

myOptionalstruct = myOptional()

print(myOptionalstruct?.property ?? 12345)
myOptionalstruct?.method()

//MARK: - optional chaining 과 Model


struct BMI {
    let value: Float
    let advice: String
    let color: String
}

struct bmicalculator {
    var bmi: BMI?
    
    func getBMIValue()->String{
        let bmivalue = String(format: "%.lf", bmi?.value ?? 0.0)
        return bmivalue
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
    func getColor()->String {
        return bmi?.color ?? "White"
    }
    
    mutating func calculator(height: Float, weight: Float){
        let bmiV  = weight / (height*height)
        if bmiV < 18.5 {
            bmi = BMI(value: bmiV, advice: "h", color: "d")
        } else if bmiV < 24.9 {
            bmi = BMI(value: bmiV, advice: "3", color: "3")
        } else {
            bmi = BMI(value: bmiV, advice: "d", color: "dd")
        }

    }
}






