let m = Int(readLine()!)!
let n = Int(readLine()!)!
var primes: [Int] = []

for num in m...n {
    if isPrime(num) { primes.append(num) }
}

if primes.isEmpty { 
    print(-1)
} else {
    print("\(primes.reduce(0, +))\n\(primes.first!)")
}


func isPrime(_ n: Int) -> Bool {
    if n == 1 { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}

