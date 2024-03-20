final class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

final class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var front: T? { head?.value }
    var back: T? { tail?.value }
    var isEmpty: Bool { head == nil }
    
    func push(_ x: T) {
        let new = Node(value: x)
        
        if head == nil {
            head = new
        } else {
            tail?.next = new
        }
        
        tail = new
    }
    
    func pop() -> T? {
        let first = front
        
        head = head?.next
        if head == nil {
            tail = nil
        }
        
        return first
    }
}

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]
let maximum = 200000
let queue = Queue<Int>()
var times: [(time: Int, before: Int)] = .init(repeating: (-1, -1), count: maximum + 1)
times[n] = (0, -1)
queue.push(n)

while let cur = queue.pop() {
    let dx = [cur * 2, cur + 1, cur - 1]

    for index in 0..<3 {
        let nx = dx[index]
        if !(0...maximum ~= nx) || times[nx].time != -1 { continue }
        times[nx] = (times[cur].time + 1, cur)
        queue.push(nx)
    }
}

var ans = "\(times[k].time)\n"
var coordinates: [Int] = [k]

var last: Int = k
for _ in 0..<times[k].time {
    last = times[last].before
    coordinates.append(last)
}

ans += coordinates.reversed()
.map { String($0) }
.joined(separator: " ")

print(ans)