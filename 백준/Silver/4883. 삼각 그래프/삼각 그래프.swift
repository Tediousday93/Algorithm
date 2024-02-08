var testCount: Int = 0

while let rowCount = Int(readLine()!), rowCount != 0 {
    testCount += 1

    var dp: [[Int]] = [[0, 0, 0]]
    for _ in 0..<rowCount {
        dp.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    dp[1][0] = Int.max
    dp[1][2] += dp[1][1]

    for row in 2..<rowCount+1 {
        dp[row][0] += min(dp[row-1][0], dp[row-1][1])
        dp[row][1] += min(dp[row-1][0], dp[row-1][1], dp[row-1][2], dp[row][0])
        dp[row][2] += min(dp[row-1][1], dp[row-1][2], dp[row][1])
    }

    print(String(testCount) + ". " + String(dp[rowCount][1]))
}