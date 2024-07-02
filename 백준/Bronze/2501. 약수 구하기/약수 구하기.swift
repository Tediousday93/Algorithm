let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0], k = nk[1]
var divisors: [Int] = []
var curDivider = 1
while curDivider <= n && divisors.count < k {
    if n % curDivider == 0 { divisors.append(curDivider) }
    curDivider += 1
}
print(divisors.count < k ? 0 : divisors[k - 1])