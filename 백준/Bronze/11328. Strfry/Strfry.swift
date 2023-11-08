let n: Int = Int(readLine()!)!
var results: [String] = []

for _ in 1...n {
    let input = readLine()!.split(separator: " ")
    let a: [String] = input[0].map { String($0) }
    let b: [String] = input[1].map { String($0) }
    var occurA: [Int] = .init(repeating: 0, count: 26)
    var occurB: [Int] = .init(repeating: 0, count: 26)
    
    for ch in a {
        let index = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("a").value)
        occurA[index] += 1
    }
    
    for ch in b {
        let index = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("a").value)
        occurB[index] += 1
    }
    
    occurA == occurB ? results.append("Possible") : results.append("Impossible")
}

for result in results {
    print(result)
}