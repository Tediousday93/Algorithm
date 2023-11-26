func solution() {
    let input = readLine()!.map { String($0) }
    var stack: [String] = []
    var tmp: Int = 1
    var result: Int = 0
    
    for i in 0..<input.count {
        switch input[i] {
        case "(":
            tmp *= 2
            stack.append(input[i])
        case "[":
            tmp *= 3
            stack.append(input[i])
        case ")":
            if stack.isEmpty || stack.last! != "(" {
                print("0")
                return
            }
            if input[i-1] == "(" {
                result += tmp
            }
            stack.removeLast()
            tmp /= 2
        case "]":
            if stack.isEmpty || stack.last! != "[" {
                print("0")
                return
            }
            if input[i-1] == "[" {
                result += tmp
            }
            stack.removeLast()
            tmp /= 3
        default:
            return
        }
    }
    
    if stack.isEmpty {
        print(result)
    } else {
        print("0")
    }
}

solution()