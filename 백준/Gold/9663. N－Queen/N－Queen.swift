let n = Int(readLine()!)!
var count: Int = 0
var isUsed1: [Bool] = .init(repeating: false, count: n)
var isUsed2: [Bool] = .init(repeating: false, count: 2*n-1)
var isUsed3: [Bool] = .init(repeating: false, count: 2*n-1)

func solution(cur: Int) {
    if cur == n {
        count += 1
        return
    }
    
    for i in 0..<n {
        if !(isUsed1[i]) && !(isUsed2[cur+i]) && !(isUsed3[cur-i+n-1]) {
            isUsed1[i] = true
            isUsed2[cur+i] = true
            isUsed3[cur-i+n-1] = true
            solution(cur: cur+1)
            isUsed1[i] = false
            isUsed2[cur+i] = false
            isUsed3[cur-i+n-1] = false
        }
    }
}

solution(cur: 0)
print(count)