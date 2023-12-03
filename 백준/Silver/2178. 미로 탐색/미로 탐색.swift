final class Queue<T> {
    var arr: [T]
    var head: Int = 0
    var tail: Int = 0
    
    init(arr: [T]) {
        self.arr = arr
    }
    
    var front: T {
        return arr[head]
    }
    
    var back: T {
        return arr[tail-1]
    }
    
    var isEmpty: Bool {
        return head == tail
    }
    
    func push(_ t: T) {
        arr[tail] = t
        tail += 1
    }
    
    func pop() {
        head += 1
    }
}

let nm = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n = nm[0]
let m = nm[1]
var board: [[Int]] = .init()
var queue: Queue<(Int, Int)> = .init(arr: .init(repeating: (-1, -1), count: 10005))

for _ in 0..<n {
    let yList = readLine()!.compactMap { Int(String($0)) }
    board.append(yList)
}

var distance: [[Int]] = .init(
    repeating: .init(repeating: -1, count: m),
    count: n
)

let dx = [1, 0, -1 ,0]
let dy = [0, 1, 0, -1]

queue.push((0, 0))
distance[0][0] = 1

while !queue.isEmpty {
    let cur = queue.front
    queue.pop()
    
    for i in 0...3 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]
        
        if (0..<n).contains(nx) && (0..<m).contains(ny),
           distance[nx][ny] == -1 && board[nx][ny] == 1 {
            distance[nx][ny] = distance[cur.0][cur.1] + 1
            queue.push((nx, ny))
        }
    }
}

print(distance[n-1][m-1])