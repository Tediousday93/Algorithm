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
    func testCase() {
        let wh = readLine()!.split(separator: " ").compactMap { Int($0) }
        let w = wh[0]
        let h = wh[1]
        var board: [[Character]] = []
        var distance: [[Int]] = .init(
            repeating: .init(repeating: -1, count: w),
            count: h
        )
        var fire: [[Int]] = .init(
            repeating: .init(repeating: -1, count: w),
            count: h
        )
        let Q1: Queue<(Int, Int)> = .init(arr: .init(repeating: (-1, -1), count: w*h + 5))
        let Q2: Queue<(Int, Int)> = .init(arr: .init(repeating: (-1, -1), count: w*h + 5))
        for x in 0..<h {
            let list = readLine()!.map { $0 }
            board.append(list)
            for y in 0..<w {
                if list[y] == "@" {
                    distance[x][y] = 0
                    Q1.push((x, y))
                } else if list[y] == "*" {
                    fire[x][y] = 0
                    Q2.push((x, y))
                }
            }
        }
        
        let dx: [Int] = [1, 0, -1, 0]
        let dy: [Int] = [0, 1, 0, -1]
        
        while !Q2.isEmpty {
            let cur = Q2.front
            Q2.pop()
            
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                
                if !(0..<h ~= nx) || !(0..<w ~= ny) { continue }
                if board[nx][ny] == "#" || fire[nx][ny] != -1 { continue }
                fire[nx][ny] = fire[cur.0][cur.1] + 1
                Q2.push((nx, ny))
            }
        }
        
        while !Q1.isEmpty {
            let cur = Q1.front
            Q1.pop()
            
            for i in 0...3 {
                let nx = cur.0 + dx[i]
                let ny = cur.1 + dy[i]
                
                if !(0..<h ~= nx) || !(0..<w ~= ny) {
                    print(distance[cur.0][cur.1] + 1)
                    return
                }
                if board[nx][ny] == "#" || distance[nx][ny] != -1 {
                    continue
                }
                if fire[nx][ny] != -1 && fire[nx][ny] <=  distance[cur.0][cur.1] + 1 {
                    continue
                }
                
                distance[nx][ny] = distance[cur.0][cur.1] + 1
                Q1.push((nx, ny))
            }
        }
        
        print("IMPOSSIBLE")
    }
    
    let t = Int(readLine()!)!
    for _ in 0..<t {
        testCase()
    }
}

solution()