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

let memberCount = Int(readLine()!)!
var graph: [[Int]] = .init(repeating: [], count: memberCount + 1)
var points: [Int] = .init(repeating: 0, count: memberCount + 1)
points[0] = Int.max

while let input = readLine() {
    if input == "-1 -1" { break }
    let friends = input.split(separator: " ").compactMap { Int($0) }
    graph[friends[0]].append(friends[1])
    graph[friends[1]].append(friends[0])
}

func bfs(start: Int) -> Int {
    let queue: Queue<(Int, Int)> = .init()
    var vis: [Bool] = .init(repeating: false, count: memberCount + 1)

    queue.push((start, 0))
    vis[start] = true

    var point = 0
    while let cur = queue.pop() {
        point = max(cur.1, point)

        for next in graph[cur.0] {
            if vis[next] { continue }
            queue.push((next, cur.1 + 1))
            vis[next] = true
        }
    }

    return point
}

for member in 1...memberCount {
    points[member] = bfs(start: member)
}

let minPoint = points.min()!
var candidates: [Int] = []
for (member, point) in points.enumerated() {
    if point == minPoint { candidates.append(member) }
}
print("\(minPoint) \(candidates.count)\n" + candidates.map(String.init).joined(separator: " "))