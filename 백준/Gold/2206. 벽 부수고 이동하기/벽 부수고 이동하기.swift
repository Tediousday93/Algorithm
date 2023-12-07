final class Queue<T> {
    var arr: [T] = []
    var head: Int = 0
    
    var front: T { arr[head] }
    var isEmpty: Bool { arr.count <= head }
    
    func push(_ t: T) {
        arr.append(t)
    }
    
    func pop() {
        head += 1
    }
}

func solution() {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]
    var board: [[Int]] = []
    for _ in 0..<n {
        let list = readLine()!.compactMap { Int(String($0)) }
        board.append(list)
    }
    var distance: [[[Int]]] = .init(
        repeating: .init(repeating: [-1, -1], count: m),
        count: n
    )
    let Q: Queue<(Int, Int, Int)> = .init()
    distance[0][0][0] = 1
    Q.push((0, 0, 0))
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    while !Q.isEmpty {
        let cur = Q.front
        Q.pop()
        
        for i in 0...3 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]
            if !(0..<n ~= nx) || !(0..<m ~= ny) { continue }
            if cur.2 == 1 && board[nx][ny] == 1 { continue }
            if cur.2 == 1 && distance[nx][ny][0] != -1 { continue }
            if cur.2 == 0 && board[nx][ny] == 1 && distance[nx][ny][1] == -1 {
                distance[nx][ny][1] = distance[cur.0][cur.1][0] + 1
                Q.push((nx, ny, 1))
            } else if board[nx][ny] == 0 && distance[nx][ny][cur.2] == -1 {
                distance[nx][ny][cur.2] = distance[cur.0][cur.1][cur.2] + 1
                Q.push((nx, ny, cur.2))
            }
        }
    }
    
    let crush = distance[n-1][m-1][1]
    let notCrush = distance[n-1][m-1][0]
    
    if crush == -1 && notCrush == -1 {
        print(-1)
        return
    }
    if crush == -1 {
        print(notCrush)
    } else if notCrush == -1 {
        print(crush)
    } else {
        print(min(crush, notCrush))
    }
}

solution()