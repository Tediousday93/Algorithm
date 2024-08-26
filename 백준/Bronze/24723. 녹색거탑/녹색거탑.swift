var n = Int(readLine()!)!
var ans = 1
while n != 0 {
    ans *= 2
    n -= 1
}
print(ans)