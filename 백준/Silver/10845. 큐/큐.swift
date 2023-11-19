var dat: [Int] = .init(repeating: -1, count: 100005)
var head: Int = 0
var tail: Int = 0

func push(x: Int) {
    dat[tail] = x
    tail += 1
}

func pop() {
    head += 1
}

var front: Int { dat[head] }
var back: Int { dat[tail-1] }

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
    case "push":
        push(x: Int(input[1])!)
    case "pop":
        if head == tail {
            print(-1)
        } else {
            print(front)
            pop()
        }
    case "size":
        print(tail - head)
    case "empty":
        print(head == tail ? 1 : 0)
    case "front":
        if head == tail {
            print(-1)
        } else {
            print(front)
        }
    case "back":
        if head == tail {
            print(-1)
        } else {
            print(back)
        }
    default:
        break
    }
}