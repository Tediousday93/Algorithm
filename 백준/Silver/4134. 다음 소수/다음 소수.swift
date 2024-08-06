let t = Int(readLine()!)!
var ans = ""
for _ in 0..<t {
    ans += "\(minimumPrime(above: Int(readLine()!)!))\n"
}
print(ans)

func minimumPrime(above num: Int) -> Int {
    var cur = num
    while !isPrime(number: cur) {
        cur += 1
    }
    return cur
}

func isPrime(number: Int) -> Bool {
    if number <= 1 { return false }
    var dividing = 2
    while dividing * dividing <= number {
        if number % dividing == 0 { return false }
        dividing += 1
    }
    return true
}