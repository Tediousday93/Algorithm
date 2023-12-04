final class Queue<T> {
    var arr: [T]
    var head: Int = 0
    var tail: Int = 0
    
    init(arr: [T]) {
        self.arr = arr
    }
    
    var front: T { arr[head] }
    var isEmpty: Bool { head == tail }
    
    func push(_ t: T) {
        arr[tail] = t
        tail += 1
    }
    
    func pop() {
        head += 1
    }
}

func solution() {
    let mnh = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = mnh[0]
    let n = mnh[1]
    let h = mnh[2]
    var board: [[[Int]]] = []
    var distance: [[[Int]]] = .init(
        repeating: .init(repeating: .init(repeating: -1, count: m),
                         count: n),
        count: h
    )
    let Q: Queue<(Int, Int, Int)> = .init(
        arr: .init(repeating: (-1, -1, -1), count: m*n*h + 5)
    )
    for z in 0..<h {
        var box: [[Int]] = []
        for y in 0..<n {
            let list = readLine()!.split(separator: " ").compactMap { Int($0) }
            box.append(list)
            for x in 0..<m {
                if list[x] == 1 {
                    distance[z][y][x] = 0
                    Q.push((z, y, x))
                }
            }
        }
        board.append(box)
    }
    
    let dz: [Int] = [0, 0, 0, 0, 1, -1]
    let dy: [Int] = [0, 0, 1, -1, 0, 0]
    let dx: [Int] = [1, -1, 0, 0, 0, 0]
    
    while !Q.isEmpty {
        let cur = Q.front
        Q.pop()
        
        for i in 0...5 {
            let nz = cur.0 + dz[i]
            let ny = cur.1 + dy[i]
            let nx = cur.2 + dx[i]
            
            if !(0..<h ~= nz) || !(0..<n ~= ny) || !(0..<m ~= nx) { continue }
            if board[nz][ny][nx] != 0 || distance[nz][ny][nx] != -1 { continue }
            board[nz][ny][nx] = 1
            distance[nz][ny][nx] = distance[cur.0][cur.1][cur.2] + 1
            Q.push((nz, ny, nx))
        }
    }
    var days: Set<Int> = []
    
    for z in 0..<h {
        for y in 0..<n {
            for x in 0..<m {
                if board[z][y][x] == 0 {
                    print(-1)
                    return
                } else {
                    days.insert(distance[z][y][x])
                }
            }
        }
    }
    
    if days.isEmpty {
        print(-1)
    } else {
        print(days.max()!)
    }
}

solution()