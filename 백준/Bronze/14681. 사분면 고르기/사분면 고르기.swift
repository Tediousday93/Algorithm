let x = Int(readLine()!)!
let y = Int(readLine()!)!
let isXPositive = x > 0
let isYPositive = y > 0
var ans = 0
if isXPositive && isYPositive {
    ans = 1
} else if isXPositive && !isYPositive {
    ans = 4
} else if !isXPositive && isYPositive {
    ans = 2
} else {
    ans = 3
}
print(ans)