let n = Int(readLine()!)!
var t: [Int] = []
var p: [Int] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    t.append(input[0])
    p.append(input[1])
}

var d: [Int] = .init(repeating: 0, count: n+2)
for i in stride(from: n, through: 1, by: -1) {
    if i + t[i-1] <= n + 1 {
        d[i] = max(d[i + t[i-1]] + p[i-1], d[i+1])
    } else {
        d[i] = d[i+1]
    }
}

print(d.max()!)