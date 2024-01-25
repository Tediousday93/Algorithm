let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }
let aCount = a.count
let bCount = b.count
var d: [[Int]] = .init(repeating: .init(repeating: 0, count: bCount+1), count: aCount+1)

for i in 1...aCount {
    for j in 1...bCount {
        if a[i-1] == b[j-1] {
            d[i][j] = d[i-1][j-1] + 1
        } else {
            d[i][j] = max(d[i][j-1], d[i-1][j])
        }
    }
}

print(d[aCount][bCount])