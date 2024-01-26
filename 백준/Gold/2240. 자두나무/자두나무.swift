let TW = readLine()!.split(separator: " ").compactMap { Int($0) }
let t = TW[0]
let w = TW[1]
var d: [[Int]] = .init(repeating: .init(repeating: 0, count: w+1), count: t+1)
var jadunamu: [Int] = [0]

for _ in 0..<t {
    let num = Int(readLine()!)!
    jadunamu.append(num)
}

for i in 1...t {
    d[i][0] = d[i-1][0] + (jadunamu[i] == 1 ? 1 : 0)
}

for i in 1...t {
    for j in 1...w {
        d[i][j] = max(d[i-1][j-1], d[i-1][j]) + (j%2 + 1 == jadunamu[i] ? 1 : 0)
    }
}

print(d[t].max()!)