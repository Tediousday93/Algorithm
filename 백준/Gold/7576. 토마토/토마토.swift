final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

final class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var front: T? {
        return head?.value
    }
    
    var back: T? {
        return tail?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func push(_ x: T) {
        let n = Node<T>(value: x)
        
        if head == nil {
            head = n
            tail = head
        } else {
            tail?.next = n
            tail = n
        }
    }
    
    func pop() {
        head = head?.next
        if head == nil {
            tail = nil
        }
    }
}

func solution() {
    let size = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let m = size[0]
    let n = size[1]
    var tomatos: [[Int]] = []
    let queue = Queue<(Int, Int)>()
    var distance: [[Int]] = .init(
        repeating: [Int].init(repeating: -1, count: m),
        count: n
    )
    
    for _ in 0..<n {
        let yList = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        tomatos.append(yList)
    }
    
    func bfs() {
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]
        
        while let cur = queue.front {
            queue.pop()
            
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                
                if (0..<n).contains(nx) && (0..<m).contains(ny),
                   distance[nx][ny] == -1 {
                    distance[nx][ny] = distance[cur.0][cur.1] + 1
                    queue.push((nx, ny))
                }
            }
        }
    }
    
    for x in 0..<n {
        for y in 0..<m {
            if tomatos[x][y] != 0 {
                distance[x][y] = 0
            }
            if tomatos[x][y] == 1 {
                queue.push((x, y))
            }
        }
    }
    
    bfs()
    
    var ans: Int = 0
    for x in 0..<n {
        for y in 0..<m {
            if distance[x][y] == -1 {
                print(-1)
                return
            }
            ans = max(ans, distance[x][y])
        }
    }
    print(ans)
}

solution()