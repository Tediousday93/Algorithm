let n = Int(readLine()!)!
var d: [[Int]] = .init(repeating: .init(repeating: 0, count: 10), count: n)
d[0][0] = 0
for i in 1...9 {
    d[0][i] = 1
}

for i in 1..<n {
    d[i][0] = d[i-1][1]
    for j in 1...8 {
        d[i][j] = (d[i-1][j-1] + d[i-1][j+1]) % 1000000000
    }
    d[i][9] = d[i-1][8]
}

print(d[n-1].reduce(0, +) % 1000000000)