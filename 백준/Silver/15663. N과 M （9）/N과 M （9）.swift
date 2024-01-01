let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let list = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .sorted(by: <)
    .map { String($0) }
var isUsed: [Bool] = .init(repeating: false, count: n)
var result = ""

func solution(k: Int, cur: String) {
    if k == m {
        result += cur + "\n"
        return
    }
    
    var tmp: String = ""
    for i in 0..<n {
        if !isUsed[i] && tmp != list[i] {
            isUsed[i] = true
            solution(k: k+1, cur: cur + list[i] + " ")
            isUsed[i] = false
            tmp = list[i]
        }
    }
}

solution(k: 0, cur: "")
print(result)