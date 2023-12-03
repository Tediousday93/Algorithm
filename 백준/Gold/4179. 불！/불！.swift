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
    let rc = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let r = rc[0]
    let c = rc[1]
    var board: [[String]] = .init()
    var fTimes: [[Int]] = .init(
        repeating: .init(repeating: -1, count: c),
        count: r
    )
    var jTimes: [[Int]] = .init(
        repeating: .init(repeating: -1, count: c),
        count: r
    )
    let fQ: Queue<(Int, Int)> = .init()
    let jQ: Queue<(Int, Int)> = .init()
    for x in 0..<r {
        let list = readLine()!.map { String($0) }
        board.append(list)
        
        for y in 0..<c {
            switch list[y] {
            case "J":
                jQ.push((x, y))
                jTimes[x][y] = 0
            case "F":
                fQ.push((x, y))
                fTimes[x][y] = 0
            default:
                break
            }
        }
    }
    
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    
    while !fQ.isEmpty {
        let cur = fQ.front!
        fQ.pop()
        
        for i in 0...3 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            
            if !(0..<r ~= nx) || !(0..<c ~= ny) { continue }
            if board[nx][ny] == "#" || fTimes[nx][ny] >= 0 { continue }
            
            fTimes[nx][ny] = fTimes[cur.0][cur.1] + 1
            fQ.push((nx, ny))
        }
    }
    
    while !jQ.isEmpty {
        let cur = jQ.front!
        jQ.pop()
        
        for i in 0...3 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            
            if !(0..<r ~= nx) || !(0..<c ~= ny) {
                print(jTimes[cur.0][cur.1] + 1)
                return
            }
            
            if jTimes[nx][ny] >= 0 || board[nx][ny] == "#" { continue }
            if fTimes[nx][ny] != -1 && (fTimes[nx][ny] <= jTimes[cur.0][cur.1] + 1) { continue }
            
            jTimes[nx][ny] = jTimes[cur.0][cur.1] + 1
            jQ.push((nx, ny))
        }
    }
    
    print("IMPOSSIBLE")
}

solution()