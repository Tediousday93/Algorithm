let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let countOfCoin = nk[0]
let target = nk[1]
var coins: [Int] = .init(repeating: 0, count: countOfCoin)

var index = countOfCoin - 1
while index != -1 {
    coins[index] = Int(readLine()!)!
    index -= 1
}

var ans: Int = 0
var remains: Int = target

for coin in coins {
    if remains == 0 { break }

    if remains >= coin {
        ans += remains / coin
        remains = remains % coin
    }
}

print(ans)