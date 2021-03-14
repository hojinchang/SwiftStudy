import UIKit

//{(매개변수 목록) -> 반환타임 in
//    실행 코드
//}

func sumFuction(a: Int, b: Int) -> Int {return a + b} // 함수
var sumResult2: Int = sumFuction(a: 1, b: 2)

let sum: (Int, Int) -> Int = {(a: Int, b: Int) in
    return a + b
}

let sumResult: Int  = sum(1, 2)
print(sumResult)

let add: (Int, Int)->Int //인트 2개를 받고 인트 하나를 방출하는 클로저 자료형 add
let substract: (Int, Int) -> Int
let devide: (Int, Int) -> Int
let multiply: (Int, Int) -> Int

add = {(a: Int, b: Int) -> Int in return a + b}
substract = {(a: Int, b: Int) -> Int in return a - b}
devide = {(a: Int, b: Int) -> Int in return a / b}
multiply = {(a: Int, b: Int) -> Int in return a * b}


func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 1, b: 2, method: add)
print(calculated)

calculated = calculate(a: 3, b: 4, method: { (a, b) -> Int in
    return a + b
})

print(calculated)


//후행클로저
//클로저가 함수의 마지막 전달인자라면
//마지막 매개변수 이름을 생략한 후
//함수 소괄호 외부에 클로저를 구현할 수 있습니다.

var result: Int
result = calculate(a: 10, b: 20) { (left: Int, right: Int) -> Int in
    return left + right
}

print(result)

//MARK: 반환타입 생략
//calculcated 함수의 methoed 매개변수는
//Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에
//굳이 클로저에서 반환타입을 명시해주지 않아도 된다.
//대신 in 키워드는 생략 X

result = calculate(a: 10, b: 20, method: { (left: Int, right: Int) in
    return left + right
})
result = calculate(a: 10, b: 20){(left: Int, right: Int) in return
    left + right
}

//MARK: 단축인자이름
//클로저의 매개변수 이름이 굳이 불필요하다면 단축인자이름을 사용할 수 있다
//단축 인자 이름은 클로저의 매개변수의 순서대로 $0, $1 .. 처럼 표현됩니다.

result = calculate(a: 10, b: 20, method: {
    return $0 + $1
})
result = calculate(a: 10, b: 20){
    return $0 + $1
}

//MARK: 암시적 반환 표현
//클로저가 반환하는 값이 있다면
//클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급합니다.

result = calculate(a: 10, b: 20){$0 + $1}

// 비교
result = calculate(a: 10, b: 20, method: { (left: Int, right: Int) -> Int in
    return left + right
})

func plus(a: Int, b: Int) -> Int {return a+b}
let add2: (Int, Int)-> Int = plus(a:b:)
