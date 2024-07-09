let a = Int(readLine()!)!, b = Int(readLine()!)!, c = Int(readLine()!)!
let sum = a + b + c
var ans = ""
if sum == 180 {
    if a == b && b == c {
        ans = "Equilateral"
    } else if a == b || b == c || c == a {
        ans = "Isosceles"
    } else {
        ans = "Scalene"
    }
} else {
    ans = "Error"
}
print(ans)