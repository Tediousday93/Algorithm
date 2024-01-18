let n = Int(readLine()!)!
var d: [Int] = .init(repeating: 0, count: 1001)
d[1] = 1
d[2] = 2
for i in stride(from: 3, through: n, by: 1) {
    d[i] = (d[i-1] + d[i-2]) % 10007
}
print(d[n])