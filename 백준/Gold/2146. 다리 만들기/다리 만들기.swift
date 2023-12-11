final class Queue<T> {
    var arr: [T] = []
    var head: Int = 0
    var front: T { return arr[head] }
    var isEmpty: Bool { arr.count <= head }
    func push(_ t: T) {
        arr.append(t)
    }
    func pop() {
        head += 1
    }
}

let N = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<N {
    let list = readLine()!.compactMap { Int(String($0)) }
    board.append(list)
}
var S: [(Int, Int)] = []
var vis: [[Bool]] = .init(
    repeating: .init(repeating: false, count: N),
    count: N
)
let Q: Queue<(Int, Int)> = .init()
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]
var length: [Int] = []

for x in 0..<N {
    for y in 0..<N {
        if board[x][y] != 1 || vis[x][y] { continue }
        vis[x][y] = true
        S.append((x, y))
        var distance: [[Int]] = .init(
            repeating: .init(repeating: -1, count: N),
            count: N
        )
        while let cur = S.popLast() {
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                if !(0..<N ~= nx) || !(0..<N ~= ny) { continue }
                if board[nx][ny] == 0 {
                    distance[nx][ny] = 1
                    Q.push((nx, ny))
                    continue
                }
                if vis[nx][ny] { continue }
                vis[nx][ny] = true
                S.append((nx, ny))
            }
        }
        
        while !Q.isEmpty {
            let cur = Q.front
            Q.pop()
            
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                if !(0..<N ~= nx) || !(0..<N ~= ny) { continue }
                if board[nx][ny] == 1 {
                    if vis[nx][ny] == false {
                        length.append(distance[cur.0][cur.1])
                    }
                    
                    continue
                }
                if distance[nx][ny] != -1 { continue }
                distance[nx][ny] = distance[cur.0][cur.1] + 1
                Q.push((nx, ny))
            }
        }
    }
}

print(length.min()!)