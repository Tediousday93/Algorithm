let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = ns[0]
let s = ns[1]
var count: Int = 0
var arr: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }

func solution(k: Int, sum: Int) {
    if k == n {
        if sum == s { count += 1 }
        return
    }
    
    solution(k: k+1, sum: sum)
    solution(k: k+1, sum: sum + arr[k])
}

solution(k: 0, sum: 0)
if s == 0 { count -= 1 }
print(count)