let n = Int(readLine()!)!
var d: [[Int]] = .init(repeating: .init(repeating: 0, count: 10), count: n)
d[0][0] = 0
for i in 1...9 {
    d[0][i] = 1
}

for i in 1..<n {
    for j in 0...9 {
        if j == 0 {
            d[i][j] = d[i-1][j+1]
        } else if j == 9 {
            d[i][j] = d[i-1][j-1]
        } else {
            d[i][j] = (d[i-1][j-1] + d[i-1][j+1]) % 1000000000
        }
    }
}

print(d[n-1].reduce(0, +) % 1000000000)