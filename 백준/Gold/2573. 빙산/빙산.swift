final class Queue<T> {
    var arr: [T] = []
    var head: Int = 0
    
    var front: T {
        return arr[head]
    }
    var count: Int {
        arr.count - head
    }
    var isEmpty: Bool {
        arr.count <= head
    }
    func push(_ x: T) {
        arr.append(x)
    }
    func pop() {
        head += 1
    }
}

func solution() {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]
    let Q: Queue<(Int, Int)> = .init()
    var board: [[Int]] = []
    for _ in 0..<n {
        let list = readLine()!.split(separator: " ").compactMap { Int($0) }
        board.append(list)
    }
    var years: [[Int]] = .init(
        repeating: .init(repeating: 0, count: m),
        count: n
    )
    var curYear: Int = 0
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    
    func melt(at pair: (Int, Int)) {
        years[pair.0][pair.1] = curYear
        Q.push(pair)
        
        while !Q.isEmpty {
            let cur = Q.front
            Q.pop()
            
            var zeroCount: Int = 0
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                if !(0..<n ~= nx) || !(0..<m ~= ny) { continue }
                if years[nx][ny] == curYear { continue }
                if board[nx][ny] == 0 {
                    zeroCount += 1
                } else if board[nx][ny] != 0 && years[nx][ny] != curYear {
                    years[nx][ny] = curYear
                    Q.push((nx, ny))
                }
            }
            let sub = board[cur.0][cur.1] - zeroCount
            if sub < 0 {
                board[cur.0][cur.1] = 0
            } else {
                board[cur.0][cur.1] = sub
            }
        }
    }
    
    
    while true {
        curYear += 1
        var iceCount: Int = 0
        for x in 0..<n {
            for y in 0..<m {
                if iceCount >= 2 {
                    print(curYear - 1)
                    return
                }
                if board[x][y] == 0 { continue }
                if years[x][y] == curYear { continue }
                melt(at: (x, y))
                iceCount += 1
            }
        }
        if iceCount == 0 {
            print(0)
            return
        }
    }
}

solution()