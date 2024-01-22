let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }
var d: [Int] = .init(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if a[i] > a[j] {
            d[i] = max(d[j] + 1, d[i])
        }
    }
}

print(d.max()!)