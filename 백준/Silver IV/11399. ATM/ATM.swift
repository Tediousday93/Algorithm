var n = Int(readLine()!)!
var withdrawTimes: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
withdrawTimes.sort(by: <)

var ans: Int = 0
withdrawTimes.forEach { time in
                       ans += time * n
                       n -= 1
                      }

print(ans)