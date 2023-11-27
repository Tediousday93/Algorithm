let n: Int = Int(readLine()!)!
var ans: Int = 0

for _ in 0..<n {
    let input = readLine()!
    var stack: [Character] = []
    for char in input {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if stack.last! != char {
                stack.append(char)
            } else {
                stack.removeLast()
            }
        }
    }
    if stack.isEmpty { ans += 1 }
}

print(ans)