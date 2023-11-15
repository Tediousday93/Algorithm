let k = Int(readLine()!)!

var stack: [Int] = []

for _ in 1...k {
    let input = Int(readLine()!)!
    if input != 0 {
        stack.append(input)
    } else {
        stack.removeLast()
    }
}

print(stack.reduce(0, +))