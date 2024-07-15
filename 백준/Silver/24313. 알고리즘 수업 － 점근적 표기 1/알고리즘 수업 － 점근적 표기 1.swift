let fCoefficients = readLine()!.split(separator: " ").compactMap { Int($0) }
let a1 = fCoefficients[0], a0 = fCoefficients[1]
let c = Int(readLine()!)!
let n0 = Int(readLine()!)!
var ans = 0
if (c - a1 > 0 && a0 / (c - a1) <= n0) || (a1 == c && a0 <= 0) {
    ans = 1
}
print(ans)