let S = readLine()!.map(String.init)
let qCount = Int(readLine()!)!
var rangeSums: [String: [Int]] = [:]
var result = ""

for _ in 0..<qCount {
    result += handleInput(readLine()!) + "\n"
}

print(result)

func occurSum(of c: String, in S: [String]) -> [Int] {
    var occurSum: [Int] = .init(repeating: 0, count: S.count)
    if c == S[0] { occurSum[0] = 1 }
    
    for i in 1..<S.count {
        occurSum[i] = occurSum[i-1]
        if c == S[i] { occurSum[i] += 1 }
    }
    
    return occurSum
}

func handleInput(_ q: String) -> String {
    let question = q.split(separator: " ").map(String.init)
    let a = question[0], l = Int(question[1])!, r = Int(question[2])!
    
    if rangeSums[a] == nil {
        rangeSums[a] = occurSum(of: a, in: S)
    }
    
    let occurSum = rangeSums[a]!
    var answer = 0
    if l == 0 {
        answer = occurSum[r]
    } else {
        answer = occurSum[r] - occurSum[l-1]
    }

    return String(answer)
}