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
    let n = nm[0]
    let m = nm[1]

    var graph: [[Int]] = .init(repeating: [], count: n + 1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }

    func getKevinNumber(of node: Int) -> Int {
        let queue: Queue<(Int, Int)> = .init()
        var vis: [Bool] = .init(repeating: false, count: n + 1)
        queue.push((node, 0))
        vis[node] = true

        var result = 0
        while let (cur, k) = queue.pop() {
            result += k

            for next in graph[cur] {
                if vis[next] { continue }
                queue.push((next, k + 1))
                vis[next] = true
            }
        }

        return result
    }

    let kevinNumbers = Array(1...n).map { getKevinNumber(of: $0) }
    print(kevinNumbers.firstIndex(of: kevinNumbers.min()!)! + 1)
}
solution()