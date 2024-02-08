let n = Int(readLine()!)!
var dp: [Int] = [0, 1, 1]

while dp.count <= abs(n) {
    let index = dp.count
    dp.append((dp[index - 1] + dp[index - 2]) % 1000000000)
}

if n < 0 && (n % 2 == 0) {
    print("-1\n\(dp[-n])")
} else if n < 0 && (n % 2 != 0) {
    print("1\n\(dp[-n])")
} else if n == 0 {
    print("0\n0")
} else {
    print("1\n\(dp[n])")
}