let t = Int(readLine()!)!
let max = 1000000
var ans = ""
let isPrime = isPrimeArr()

for _ in 0..<t {
    let n = Int(readLine()!)!
    ans += "\(partition(of: n))\n"
}

print(ans)

func isPrimeArr() -> [Bool] {
    var isPrime: [Bool] = .init(repeating: true, count: max + 5)
    isPrime[0] = false
    isPrime[1] = false

    var index = 2
    while index * index <= max + 5 {
        if !isPrime[index] {
            index += 1
            continue
        }

        for multiple in stride(from: index * index, to: max + 5, by: index) {
            isPrime[multiple] = false
        }

        index += 1
    }

    return isPrime
}

func partition(of num: Int) -> Int {
    var count = 0
    var cur = 2

    while cur <= num / 2 {
        if !isPrime[cur] {
            cur += 1
            continue
        }
        if isPrime[num - cur] { count += 1 }
        cur += 1
    }

    return count
}