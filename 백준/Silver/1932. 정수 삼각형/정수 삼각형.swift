let n = Int(readLine()!)!
var d: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    d.append(input)
}

for i in stride(from: 1, to: n, by: 1) {
    for j in 0...i {
        if j == 0 {
            d[i][j] = d[i-1][0] + d[i][j]
        } else if j == i {
            d[i][j] = d[i-1][i-1] + d[i][j]
        } else {
            d[i][j] = max(d[i-1][j-1], d[i-1][j]) + d[i][j]
        }
    }
}

print(d[n-1].max()!)