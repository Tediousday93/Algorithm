import Foundation

struct Pair<H: Hashable>: Hashable {
    var x: H
    var y: H
    
    init(_ x: H, _ y: H) {
        self.x = x
        self.y = y
    }
}

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
    
    func push(x: T) {
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

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()
let n = fileIO.readInt()
let m = fileIO.readInt()
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]
var board: [Pair<Int>: Int] = [:]
var vis: [Pair<Int>: Bool] = [:]
var Q: Queue<Pair<Int>> = .init()
var sizes: [Int] = []

for x in 0..<n {
    for y in 0..<m {
        let p = Pair(x, y)
        board[p] = fileIO.readInt()
        vis[p] = false
    }
}

func bfs(startAt pair: Pair<Int>) -> Int {
    var size: Int = 0
    vis[pair] = true
    Q.push(x: pair)

    while let cur = Q.front {
        Q.pop()
        size += 1
        
        for i in 0...3 {
            let nx = cur.x + dx[i]
            let ny = cur.y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
                    
            if vis[Pair(nx, ny)]! || board[Pair(nx, ny)] != 1 {
                continue
            }
            
            vis[Pair(nx, ny)] = true
            Q.push(x: Pair(nx, ny))
        }
    }
    
    return size
}

for x in 0..<n {
    for y in 0..<m {
        let p = Pair(x, y)
        
        if board[p] == 0 { continue }
        guard let vis = vis[p], vis == false else { continue }
        sizes.append(bfs(startAt: p))
    }
}

print(sizes.count)
sizes.count == 0 ? print("0") : print(sizes.max()!)