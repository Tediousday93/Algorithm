var arr: [Int] = .init(repeating: 0, count: 21)
var dp: [[[Int]]] = .init(
    repeating: .init(repeating: arr, count: 21), 
    count: 21
)

for i in 0..<21 {
    for j in 0..<21 {
        for k in 0..<21 {
            if i <= 0 || j <= 0 || k <= 0 {
                dp[i][j][k] = 1
            } else if i < j && j < k {
                dp[i][j][k] = dp[i][j][k-1] + dp[i][j-1][k-1] - dp[i][j-1][k]
            } else {
                dp[i][j][k] = dp[i-1][j][k] + dp[i-1][j-1][k] + dp[i-1][j][k-1] - dp[i-1][j-1][k-1]   
            }
        }
    }
}

var ans = ""
while let input = readLine(), input != "-1 -1 -1" {
    let abc = input.split(separator: " ").compactMap { Int($0) }
    let a = abc[0], b = abc[1], c = abc[2]
    var line = "w(\(a), \(b), \(c)) = "
    if a <= 0 || b <= 0 || c <= 0 { line += String(dp[0][0][0]) }
    else if a > 20 || b > 20 || c > 20 { line += String(dp[20][20][20]) }
    else { line += String(dp[a][b][c]) }
    
    ans += line + "\n"
}
print(ans)