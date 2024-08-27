var n = Int(readLine()!)!
var ans = 1

if n != 0 {
    while n > 0 {
        ans *= n
        n -= 1
    }    
}

print(ans)