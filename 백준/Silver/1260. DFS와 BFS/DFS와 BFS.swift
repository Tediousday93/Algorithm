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
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let nodeCount = nm[0]
    let edgeCount = nm[1]
    let startingNode = nm[2]
    var graph: [[Int]] = .init(repeating: [], count: nodeCount + 1)
    for _ in 0..<edgeCount {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    func dfs() -> String {
        var vis: [Bool] = .init(repeating: false, count: nodeCount + 1)
        var stack: [Int] = []
        var visited: [String] = []
        stack.append(startingNode)
        
        while let cur = stack.popLast() {
            if vis[cur] { continue }
            vis[cur] = true
            visited.append(String(cur))
            
            for next in graph[cur].sorted(by: >) {
                if vis[next] { continue }
                stack.append(next)
            }
        }
        
        return visited.joined(separator: " ")
    }
    
    func bfs() -> String {
        var vis: [Bool] = .init(repeating: false, count: nodeCount + 1)
        let queue: Queue<Int> = .init()
        var visited: [String] = [String(startingNode)]
        queue.push(startingNode)
        vis[startingNode] = true
        
        while let cur = queue.pop() {
            for next in graph[cur].sorted() {
                if vis[next] { continue }
                visited.append(String(next))
                queue.push(next)
                vis[next] = true
            }
        }
        
        return visited.joined(separator: " ")
    }
    
    let answer = dfs() + "\n" + bfs()
    print(answer)
}
solution()