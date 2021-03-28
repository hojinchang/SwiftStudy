import UIKit

func three(number: Int) -> Int{
    let threeNumber = String(number, radix: 3)          //number를 3진법으로 변환
    let tenNumber = Int(String(threeNumber.reversed()),radix: 3)!   //threeNumber를 반대로바꾼후 10진법으로 변환
    return tenNumber
}
