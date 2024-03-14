func solution() {
    let N = Int(readLine()!)!
    
    if N < 2 {
        print(0)
        return
    }
    
    var isPrime: [Bool] = .init(repeating: true, count: N + 1)
    var primeNumbers: [Int] = []
    
    for num in 2...N {
        if isPrime[num] {
            primeNumbers.append(num)
            
            for multi in stride(from: num * num, through: N, by: num) {
                isPrime[multi] = false
            }
        }
    }
    
    var serialSum = primeNumbers[0]
    var start = 0
    var end = 0
    var count = 0
    
    while end < primeNumbers.count, start <= end {
        switch serialSum {
        case N:
            count += 1
            fallthrough
        case ..<N:
            end += 1
            guard end < primeNumbers.count else { break }
            serialSum += primeNumbers[end]
        default:
            serialSum -= primeNumbers[start]
            start += 1
        }
    }
    
    print(count)
}

solution()