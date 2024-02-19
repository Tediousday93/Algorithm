let n = Int(readLine()!)!
var count: Int = 0
var clearPoints: [Int] = []

for _ in 0..<n {
    clearPoints.append(Int(readLine()!)!)
}
clearPoints = clearPoints.reversed()

for index in 1..<n {
    while clearPoints[index - 1] <= clearPoints[index] {
        clearPoints[index] -= 1
        count += 1
    }
}

print(count)