var testCount: Int = 0

while let rowCount = Int(readLine()!), rowCount != 0 {
    testCount += 1

    var graph: [[Int]] = [[]]
    for _ in 0..<rowCount {
        graph.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    var dp: [[Int]] = .init(repeating: [0, 0, 0], count: rowCount+1)
    dp[1] = [graph[1][0], graph[1][1], (graph[1][1] + graph[1][2])]
    dp[2][0] = dp[1][1] + graph[2][0]
    dp[2][1] = min(dp[1][1], dp[1][2], dp[2][0]) + graph[2][1]
    dp[2][2] = min(dp[1][1], dp[1][2], dp[2][1]) + graph[2][2]

    for row in 3..<rowCount+1 {
        dp[row][0] = min(dp[row-1][0], dp[row-1][1]) + graph[row][0]
        dp[row][1] = min(dp[row-1][0], dp[row-1][1], dp[row-1][2], dp[row][0]) + graph[row][1]
        dp[row][2] = min(dp[row-1][1], dp[row-1][2], dp[row][1]) + graph[row][2]
    }

    print(String(testCount) + ". " + String(dp[rowCount][1]))
}