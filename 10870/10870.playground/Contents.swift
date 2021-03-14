import UIKit
import Foundation

func fibonazzi(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonazzi(n: n-1) + fibonazzi(n: n-2)
    }
}


print(fibonazzi(n: 10))
