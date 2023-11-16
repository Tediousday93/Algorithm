let l = Int(readLine()!)!
let n: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var stack: [Int] = []
var answer: [Int] = .init(repeating: -1, count: l)
for i in 0..<l {
    while !stack.isEmpty && n[stack.last!] < n[i] {
        let index = stack.popLast()!
        answer[index] = n[i]
    }
    
    stack.append(i)
}

print(answer.map({ String($0) }).joined(separator: " "))