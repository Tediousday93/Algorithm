let n = Int(readLine()!)!
var d: [Int] = .init(repeating: 0, count: n+1)
d[1] = 1

for i in stride(from: 2, through: n, by: 1) {
    d[i] = d[i-1] + d[i-2]
}

print(d[n])