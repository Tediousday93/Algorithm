var stack: [Int] = []
let n = Int(readLine()!)!

for _ in 1...n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    switch command[0] {
    case "push":
        stack.append(Int(command[1])!)
    case "pop":
        var last: Int = 0
        if stack.isEmpty {
            last = -1
        } else {
            last = stack.removeLast()
        }
        print(last)
    case "size":
        print(stack.count)
    case "empty":
        if stack.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case "top":
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.last!)
        }
    default:
        break
    }
}