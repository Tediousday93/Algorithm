let n = Int(readLine()!)!
var count: Int = 0
var clearPoints: [Int] = .init(repeating: 0, count: n)

for i in stride(from: n-1, through: 0, by: -1) {
    clearPoints[i] = Int(readLine()!)!
}

for index in 1..<n {
    while clearPoints[index - 1] <= clearPoints[index] {
        clearPoints[index] -= 1
        count += 1
    }
}

print(count)