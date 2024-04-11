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

let n = Int(readLine()!)!
let listLength = Int(readLine()!)!

var graph: [[Int]] = .init(repeating: [], count: n+1)
for _ in 0..<listLength {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var toInvite = 0

func bfs() {
    let queue: Queue<Int> = .init()
    var vis: [Bool] = .init(repeating: false, count: n+1)
    vis[0] = true

    queue.push(1)
    vis[1] = true

    while let cur = queue.pop() {
        for next in graph[cur] {
            if vis[next] { continue }
            if cur != 1, !graph[cur].contains(1) { continue }
            toInvite += 1
            queue.push(next)
            vis[next] = true
        }
    }
}

bfs()
print(toInvite)