let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let coinCount = input[0]
let targetSum = input[1]

var coinPoints: [Int] = []
for _ in 0..<coinCount {
    coinPoints.append(Int(readLine()!)!)
}

var dp: [Int] = .init(repeating: 0, count: targetSum+1)
dp[0] = 1

for pointIndex in 0..<coinCount {
    let currentPoint = coinPoints[pointIndex]

    for dpIndex in stride(from: currentPoint, through: targetSum, by: 1) {
        guard Int.max - dp[dpIndex - currentPoint] > dp[dpIndex] else {
            continue
        }
        dp[dpIndex] += dp[dpIndex - currentPoint]
    }
}

print(dp[targetSum])