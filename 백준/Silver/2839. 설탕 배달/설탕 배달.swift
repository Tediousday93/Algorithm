var n = Int(readLine()!)!
var threeCount = 0
var fiveCount = 0

while n >= 3 && n % 5 != 0 {
    n -= 3
    threeCount += 1
    if n % 5 == 0 { break }
}
fiveCount = n / 5

if n % 5 != 0 {
    print(-1)
} else {
    print(threeCount + fiveCount)
}