let year = Int(readLine()!)!
var ans = 0
if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) {
    ans = 1
}
print(ans)