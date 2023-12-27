let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let list = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: <)
var result: String = ""

func solution(k: Int, cur: [Int], start: Int) {
    if k == m {
        result += cur.map(String.init).joined(separator: " ") + "\n"
        return
    }
    
    for i in start..<n {
        solution(k: k+1, cur: cur + [list[i]], start: i+1)
    }
}

solution(k: 0, cur: [], start: 0)
print(result)