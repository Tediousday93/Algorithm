let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]
var dp: [[Int]] = [[1], [1, 1], [1, 2, 1]]

for index in stride(from: 3, through: n, by: 1) {
    var dpElement: [Int] = .init(repeating: 0, count: index+1)
    dpElement[0] = 1
    dpElement[index] = 1

    for subIndex in stride(from: 1, through: index-1, by: 1) {
        dpElement[subIndex] = (dp[index-1][subIndex] + dp[index-1][subIndex-1]) % 10007
    }

    dp.append(dpElement)
}

print(dp[n][k])