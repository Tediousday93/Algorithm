let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp: [Int] = a

for i in 0..<n {
    for j in 0..<i {
        if a[i] > a[j] {
            dp[i] = max(dp[i], dp[j] + a[i])
        }
    }
}

print(dp.max()!)