var n = Int(readLine()!)!
var ans = ""

var dividing: Int = 2
while dividing * dividing <= n {
    while n % dividing == 0 {
        n = n / dividing
        ans += String(dividing) + "\n"
    }

    dividing += 1
}
if n != 1 { ans += String(n) }
print(ans)