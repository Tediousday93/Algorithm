var n = Int(readLine()!)!
var withdrawTimes: [Int] = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .sorted()
var ans: Int = 0
for time in withdrawTimes {
    ans += time * n
    n -= 1
}

print(ans)