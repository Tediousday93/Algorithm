let length = Int(readLine()!)!

var d: [[Int]] = .init(repeating: .init(repeating: 0, count: 10), count: length+1)
d[1] = .init(repeating: 1, count: 10)

for i in 2..<length+1 {
    let prevSum = d[i-1].reduce(0, +)

    d[i][0] = prevSum % 10007
    for num in 1...9 {
        var notAscending = 0
        for j in 0..<num {
            notAscending += d[i-1][j]
        }

        d[i][num] = (prevSum - notAscending) % 10007
    }
}

print(d[length].reduce(0, +) % 10007)