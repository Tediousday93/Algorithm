let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var result: [String] = []
var isUsed: [Bool] = .init(repeating: false, count: n+1)

func solution(k: Int, arr: [Int]) {
    if k == m {
        result.append(arr.map(String.init).joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if k == 0 {
            solution(k: 1, arr: arr + [i])
        } else if let num = arr.last, i >= num {
            solution(k: k+1, arr: arr + [i])
        }
    }
}

solution(k: 0, arr: [])
print(result.joined(separator: "\n"))