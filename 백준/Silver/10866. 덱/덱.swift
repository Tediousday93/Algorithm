let n: Int = Int(readLine()!)!
var dat: [Int] = .init(repeating: -1, count: 2*n + 1)
var head: Int = n, tail: Int = n

func pushFront(x: Int) {
    dat[head-1] = x
    head -= 1
}

func pushBack(x: Int) {
    dat[tail] = x
    tail += 1
}

func popFront() {
    head += 1
}

func popBack() {
    tail -= 1
}

var size: Int {
    tail - head
}

var front: Int {
    dat[head]
}

var back: Int {
    dat[tail-1]
}

var result: String = ""
for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    switch command[0] {
    case "push_front":
        pushFront(x: Int(command[1])!)
    case "push_back":
        pushBack(x: Int(command[1])!)
    case "pop_front":
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(String(front))\n"
            popFront()
        }
    case "pop_back":
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(String(back))\n"
            popBack()
        }
    case "size":
        result += "\(String(size))\n"
    case "empty":
        if head == tail {
            result += "1\n"
        } else {
            result += "0\n"
        }
    case "front":
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(String(front))\n"
        }
    case "back":
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(String(back))\n"
        }
    default:
        break
    }
}

print(result)