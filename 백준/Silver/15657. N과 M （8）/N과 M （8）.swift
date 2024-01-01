let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let list = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .sorted(by: <)
    .map { String($0) }

var result = ""

func solution(k: Int, cur: String, start: Int) {
    if k == m {
        result += cur + "\n"
        return
    }
    
    for i in start..<n {
        if k == 0 {
            solution(k: k+1, cur: list[i], start: i)
        } else {
            solution(k: k+1, cur: cur + " " + list[i], start: i)
        }
    }
}

solution(k: 0, cur: "", start: 0)
print(result)