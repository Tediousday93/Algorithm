_ = Int(readLine()!)!
var line: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }.reversed()
var now = 1
var stack: [Int] = []

while !line.isEmpty {
    let next = line.popLast()!

    if now == next {
        now += 1

        while !stack.isEmpty && stack.last == now {
            stack.removeLast()
            now += 1
        }
    } else {
        stack.append(next)
    }
}

print(stack.isEmpty ? "Nice" : "Sad")