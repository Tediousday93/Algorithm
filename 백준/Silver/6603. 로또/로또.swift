while let input = readLine(), input != "0" {
    var S = input.split(separator: " ").compactMap { Int($0) }
    let k = S.removeFirst()
    var isUsed: [Bool] = .init(repeating: false, count: k)
    var result: [Int] = []
    
    func solution(d: Int, s: Int) {
        if d == 6 {
            print(result.map({ String($0) }).joined(separator: " "))
            return
        }
        
        for i in s..<k {
            if !isUsed[i] {
                result.append(S[i])
                isUsed[i] = true
                solution(d: d+1, s: i)
                result.removeLast()
                isUsed[i] = false
            }
        }
    }
    
    solution(d: 0, s: 0)
    print()
}