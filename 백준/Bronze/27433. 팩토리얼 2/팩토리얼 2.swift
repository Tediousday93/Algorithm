let n = Int(readLine()!)!
var ans = 1

if n != 0 {
    for i in 1...n {
        ans *= i
    }
}

print(ans)
