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

func solution() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }
    
    func isPossibleRoute(start: Int, end: Int) -> String {
        let queue: Queue<Int> = .init()
        var vis: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)
        
        queue.push(start)
        
        while let cur = queue.pop() {
            for (next, hasEdge) in graph[cur].enumerated() {
                if vis[cur][next] { continue }
                
                if hasEdge == 1 {
                    if next == end { return "1" }
                    queue.push(next)
                    vis[cur][next] = true
                }
            }
        }
        
        return "0"
    }
    
    var result: [[String]] = .init(
        repeating: .init(repeating: "", count: n),
        count: n
    )
    
    for i in 0..<n {
        for j in 0..<n {
            result[i][j] = isPossibleRoute(start: i, end: j)
        }
    }
    
    var answer = ""
    result.forEach { answer += $0.joined(separator: " ") + "\n" }
    print(answer)
}

solution()