let binaryLength = Int(readLine()!)!
var dp: [Int] = [0, 1, 2]
var index = 2
while index < binaryLength {
    dp.append((dp[index] + dp[index - 1]) % 15746)
    index += 1
}
print(dp[binaryLength])