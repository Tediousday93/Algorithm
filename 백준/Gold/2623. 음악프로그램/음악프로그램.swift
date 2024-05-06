struct Queue<T> {
    var pushStack: [T] = .init()
    var popStack: [T] = .init()
    
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    var count: Int {
        return pushStack.count + popStack.count
    }

    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }

    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            popStack = pushStack.reversed()
            pushStack.removeAll()
        }
        return popStack.popLast()
    }
}

func solution() {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]
    
    var graph: [[Int]] = .init(repeating: [], count:n)
    var indegree: [Int] = .init(repeating: 0, count: n)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        for index in 1..<input[0] {
            graph[input[index] - 1].append(input[index + 1] - 1)
            indegree[input[index + 1] - 1] += 1
        }
    }
    
    var queue: Queue<Int> = .init()
    var result: [String] = []
    
    indegree.enumerated()
        .filter { $0.element == 0 }
        .forEach { queue.enqueue($0.offset) }
    
    while let cur = queue.dequeue() {
        result.append(String(cur + 1))
        for next in graph[cur] {
            indegree[next] -= 1
            if indegree[next] == 0 { queue.enqueue(next) }
        }
    }
    
    if result.count == n {
        print(result.joined(separator: "\n"))
    } else {
        print(0)
    }
}
solution()