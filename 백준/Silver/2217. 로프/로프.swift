let n = Int(readLine()!)!
var ropes: [Int] = []
for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}

ropes.sort(by: <)

var ans: Int = 0
for k in 1...n {
    ans = max(ans, ropes[n-k] * k)
}

print(ans)