let n = Int(readLine()!)!
let s = readLine()!.split(separator: " ").compactMap { Int($0) }
var d: [Int] = .init(repeating: Int.min, count: n+1)
d[1] = s[0]

for i in stride(from: 2, through: n, by: 1) {
    d[i] = max(0, d[i-1]) + s[i-1]
}

print(d.max()!)