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

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var tree: [[(Int, Int)]] = .init(repeating: [], count: n+1)
var results: [Int] = []

for _ in 1..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v, dist) = (input[0], input[1], input[2])
    tree[u].append((v, dist))
    tree[v].append((u, dist))
}


func bfs(start: Int, target: Int) -> Int {
    var queue: Queue<(Int, Int)> = .init()
    var vis: [Bool] = .init(repeating: false, count: n+1)
    queue.enqueue((start, 0))
    vis[start] = true

    while let (cur, dist) = queue.dequeue() {
        if cur == target {
            return dist
        }

        for (next, nextDist) in tree[cur] {
            if vis[next] { continue }
            vis[next] = true
            queue.enqueue((next, dist + nextDist))
        }
    }

    return 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    results.append(bfs(start: input[0], target: input[1]))
}

print(results.map(String.init).joined(separator: "\n"))