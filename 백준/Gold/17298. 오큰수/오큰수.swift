let l: Int = Int(readLine()!)!
let n: [Int] = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.reversed()
var stack: [Int] = [1000001]
var answer: [String] = []

for i in 0..<l {
    while stack.last! <= n[i] {
        stack.removeLast()
    }

    if stack.last! == 1000001 {
        answer.append(String(-1))
    } else {
        answer.append(String(stack.last!))
    }
    stack.append(n[i])
}
print(Array(answer.reversed()).joined(separator: " "))