let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var isUsed: [Bool] = .init(repeating: false, count: n)
var arr: [Int] = .init(repeating: 0, count: m)

func solution(k: Int) {
    if k == m {
        print(arr.map({ String($0) }).joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if !isUsed[i] {
            arr[k] = i+1
            isUsed[i] = true
            solution(k: k+1)
            isUsed[i] = false
        }
    }
}

solution(k: 0)