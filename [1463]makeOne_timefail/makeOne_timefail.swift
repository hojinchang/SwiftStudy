//
//  main.swift
//  makeOne
//
//  Created by hojin on 2021/04/30.
//

import Foundation

var num = Int(readLine()!)!
var makeOneList = Array(repeating: 0, count: num+1)
makeOneList[1] = 0
makeOneList[2] = 1
makeOneList[3] = 1


// 원래 했던 방식으로 하면 무한루프에 빠지게 된다. dfs 풀듯이 배열를 만들어주는 것이 좋다.

func makeOne(num : Int) -> Int {
//    print("===========시작 ============")
//    print("여기 들어오나 ? ",num)
//    print("여기 들어오나 ??????? ",makeOneList[num])

    if (num == 1) {
        return 0
    }else if (num == 2 || num == 3){
        return 1
    }
    
    if (num % 2 == 0){
//        print("어디로 들어갔을까??? 여기는 2 ")
        makeOneList[num] = min(makeOne(num: num/2), makeOne(num: num-1))
    }else if (num % 3 == 0){
//        print("어디로 들어갔을까??? 여기는 3 ")

        makeOneList[num] = min(makeOne(num: num/3), makeOne(num: num-1))
    }else{
//        print("어디로 들어갔을까??? 여기는 -1 ")
        makeOneList[num] = makeOne(num: num-1)
    }
//    print("===========끝 ============")

    return makeOneList[num]+1
}

var cnt = makeOne(num: num)
print(cnt)

