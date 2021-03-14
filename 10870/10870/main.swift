//
//  main.swift
//  10870
//
//  Created by abc on 2021/03/07.
//

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

var input = readLine()
if let input = input {
    print(fibonazzi(n: Int(input)!))
}

