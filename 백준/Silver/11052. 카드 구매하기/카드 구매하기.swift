let cardCount = Int(readLine()!)!
var prices: [Int] = [0]
prices += readLine()!.split(separator: " ").compactMap { Int($0) }

var dp: [Int] = .init(repeating: 0, count: cardCount+1)
dp[1] = prices[1]

for toBuy in stride(from: 2, through: cardCount, by: 1) {
    var maximum: Int = 0
    for index in stride(from: 1, through: toBuy / 2, by: 1) {
        maximum = max(maximum, dp[index] + dp[toBuy - index])
    }

    dp[toBuy] = max(maximum, prices[toBuy])
}

print(dp[cardCount])