import Cocoa

/*
 subscripts
 클래스 구조, 그리고 열거형은 서브스크립트를 정의할 수 있습니다.
 안의 컬렉션, 리스트 등의 맴버항목에 접근하기 위한 단축키 설정을 하는 기능이라고 한다.
 서브스크립트를 사용하여 설정과 검색을 위해 메소드를 나눌 필요 없다는 것이 장점이다.
 -> 추가적인 메소드 없이 특정 값을 할당(set)하거나 가져오기(get) 가능
 */

//MARK: Subscript 문법
struct Mystruct {
    
    subscript(index: Int)->Int {
        get {
            // 반환값
            return 1;
        }
        set(newValue) {
            //액션
        }
    }
}

/*
 서브스크립트는 메소드와 연산 프로퍼티 선언과 비슷하다.
 read-write와 read only만 가능하다.
 set에 대한 인자 값을 지정하지 않으면, 기본 값으로 newValue를 사용한다.
 */

//읽기 전용
struct Mystruct2 {
    subscript(index: Int)-> Int {
        // 반환값
        return index;
    }
}
var mystruct2 = Mystruct2()
print(mystruct2[3])

//MARK: -예시

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index;
    }
}

let threeTimesTable = TimesTable(multiplier: 3) // init
print("six times three is \(threeTimesTable[6])") // []를 사용하면서 특정한 값을 read-write OR readonly 가 가능하다는것

//MARK: -Dictionary에서의 subscript

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
numberOfLegs
//print(numberOfLegs[2])
/*
 [String:Int] 타입의 dictionary의 subscript default
subscript(_: default: )
 */

//MARK: -서브스크립트 옵션
/*
 서브스크립트는 입력 인자의 숫자에 제한이 없고, 입력 인자의 타입과 반환 타입의 제한도 없다.
 다만 in-out인자나 기본 인자값을 제공할 수는 없다.
 오버로딩도 가능하다.
 */

struct SumSubscripts {
    subscript(value: Int...) -> Int {
        return value.reduce(0, +)
    }
}
let sumAllElements = SumSubscripts()
let sum = sumAllElements[5, 10, 5]
print("Sum \(sum)")

struct Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns);
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column), "OUT OF RANGE")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "OUT OF RANGE")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5 //setter
matrix[1, 0] = 3.2 //setter
print(matrix[0, 1]) //getter
print(matrix[1, 0]) //getter
//matrix[2, 2] = 3.6

/*
 클래스나 구조체는 필요한 경우에 많은 서브스크립트 구현을 제공할 수 있다.
 값의 타입이나 서브스크립트 사용되는 시점, 서브스크립트에 전달하는 인덱스 타입에 따라 적절한 서브스크립트가 오버로드하여 선택된다.
 */

//MARK: -Type Subscripts
// 타입자체에 첨자를 호출가능하다. 이것을 type subscripts 이다.

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, staturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars) //mars


//MARK: -CLASS 속
class FavoriteFoods {
    private var foods = ["bibimbap", "gukbap", "pizza", "steak"]
    private var seafood = ["shrimp":1, "fish":2, "oyster":3]
    subscript(index: Int) -> String {
        get {
            return self.foods[index]
        }
        set {
            self.foods[index] = newValue
        }
    }
    subscript(index2: String) -> Int? {
        get {
            return self.seafood[index2]
        }
        set {
            self.seafood[index2] = newValue
        }
    }
}
var favoriteFoods = FavoriteFoods()
print(favoriteFoods[1])  // gukbap
favoriteFoods[2] = "noodle"
favoriteFoods["shrimp"]
print(favoriteFoods[2])  // noodle

var str = "dohyun"

//MARK: -OVERLOAD
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        // index(_:offsetBy:) 중간에 있는 문자 접근 메소드 -> 시작지점부터 떨어진 정수 값 만큼을 더한위치를 반환
        // index(startindex, offsetby: 2) 하면 3번째 인덱스
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[start..<end])
    }
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
}

print(str[0..<3])
print(str[0..<10])
print(str[3...])

//MARK: - URL 뺴오는 subscript (GET 통신시)

extension URL {
    var queryParameters: QueryParameters? { return QueryParameters(url: self) }
}

class QueryParameters {
    private var queryItems: [URLQueryItem]?
    
    init?(url: URL?) {
        guard let absoluteURLString = url?.absoluteString else { return nil }
        queryItems = URLComponents(string: absoluteURLString)?.queryItems
    }
    // 이렇게하면 쿼리의 이름 : 값 형태 배열로 queryitems에 넣어짐
    // 이 queryitems를 목록으로 확인을 한다고 한다면 subsript를 사용한다는 것
    
    subscript(name: String) -> String? {
        return queryItems?.first{ $0.name == name }?.value
    }
}

let exampleURL = URL(string: "http://queryparameterexample.com?param1=value1&param2=value2")
let queryParamVal = exampleURL?.queryParameters?["param1"]
print(exampleURL?.queryParameters?["param2"])


