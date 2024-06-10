let diceNumbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let (a, b, c) = (diceNumbers[0], diceNumbers[1], diceNumbers[2])
var ans = 0

if a == b && b == c {
    ans = 10000 + (a * 1000)
} else if a == b {
    ans = 1000 + (a * 100)
} else if b == c {
    ans = 1000 + (b * 100)
} else if c == a {
    ans = 1000 + (c * 100)
} else {
    ans = max(a, b, c) * 100
}
print(ans)