//
//  main.swift
//  BaekJoon
//
//  Created by 오승기 on 2021/03/20.
//

import Foundation

let N  = Int(readLine()!)!
var arr: [Int] = []

for _ in 1...N{
    arr.append(Int(readLine()!)!)
}
arr.sort()

for i in 0..<N{
    print(arr[i])
}
