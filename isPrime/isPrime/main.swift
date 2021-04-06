import Foundation
// 함수로 소수 체크하는 것을 만들었더니 그게 더 오래 걸린다.
// 한 시간 넘게 해봤는데 안되서 검색을 해봤다.
// 그 중에 좋은 아이디어가 나왔는데, n이 소수인지 아닌지 확인하려면 루트 n까지만 확인해봐도 된다.
func isprime(_ n:Int) -> Int {
    var cnt : Int = 0
    var check : Bool = true
    // for문 두개라서 시간초과나나 ...?
    // 아니 이거 쉬운건데 왜이리 쩔쩔
    for i in 2...n{
        // 시간 초과가 나니까 일단 짝수부터 걸러내보자
        // 그래도 나네?
        check = true
        for j in 2...Int((sqrt(Double(i))))+1{
            // print("i 와 j", i, " " ,j, " ", i%j)
            if(i%j == 0 && i != j){
                // i != j 가 핵심이다.
                check = false
                break
            }
        }
        if(check) {cnt += 1}
    }
    return cnt
}
