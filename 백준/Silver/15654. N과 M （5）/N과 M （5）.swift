let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let list = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: <)
var isUsed: [Bool] = .init(repeating: false, count: n)
var result: [String] = []

func solution(k: Int, cur: [Int]) {
    if k == m {
        result.append(cur.map(String.init).joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        if !isUsed[i] {
            isUsed[i] = true
            solution(k: k+1, cur: cur + [list[i]])
            isUsed[i] = false
        }
    }
}

solution(k: 0, cur: [])
print(result.joined(separator: "\n"))