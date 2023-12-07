func solution() {
    let n = Int(readLine()!)!
    var board: [[Character]] = []
    for _ in 0..<n {
        let d = readLine()!.map { $0 }
        board.append(d)
    }
    var vis1: [[Bool]] = .init(
        repeating: .init(repeating: false, count: n),
        count: n
    )
    var vis2 = vis1
    var stack1: [(Int, Int)] = []
    var stack2 = stack1
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    
    func forRGB() -> Int {
        func dfs(T: Character) {
            while !stack1.isEmpty {
                let cur = stack1.last!
                stack1.removeLast()
                
                for i in 0...3 {
                    let nx = cur.0 + dx[i]
                    let ny = cur.1 + dy[i]
                    if !(0..<n ~= nx) || !(0..<n ~= ny) { continue }
                    if board[nx][ny] != T || vis1[nx][ny] { continue }
                    vis1[nx][ny] = true
                    stack1.append((nx, ny))
                }
            }
        }
        
        var area: Int = 0
        for x in 0..<n {
            for y in 0..<n {
                if board[x][y] == "R" && !vis1[x][y] {
                    vis1[x][y] = true
                    stack1.append((x, y))
                    area += 1
                    dfs(T: "R")
                } else if board[x][y] == "G" && !vis1[x][y] {
                    vis1[x][y] = true
                    stack1.append((x, y))
                    area += 1
                    dfs(T: "G")
                } else if board[x][y] == "B" && !vis1[x][y] {
                    vis1[x][y] = true
                    stack1.append((x, y))
                    area += 1
                    dfs(T: "B")
                }
            }
        }
        
        return area
    }
    
    func forRB() -> Int {
        func dfs(T: [Character]) {
            while !stack2.isEmpty {
                let cur = stack2.last!
                stack2.removeLast()
                
                for i in 0...3 {
                    let nx = cur.0 + dx[i]
                    let ny = cur.1 + dy[i]
                    if !(0..<n ~= nx) || !(0..<n ~= ny) { continue }
                    if !T.contains(board[nx][ny]) || vis2[nx][ny] { continue }
                    vis2[nx][ny] = true
                    stack2.append((nx, ny))
                }
            }
        }
        
        var area: Int = 0
        for x in 0..<n {
            for y in 0..<n {
                if (board[x][y] == "R" || board[x][y] == "G") && !vis2[x][y] {
                    vis2[x][y] = true
                    stack2.append((x, y))
                    area += 1
                    dfs(T: ["R", "G"])
                } else if board[x][y] == "B" && !vis2[x][y] {
                    vis2[x][y] = true
                    stack2.append((x, y))
                    area += 1
                    dfs(T: ["B"])
                }
            }
        }
        
        return area
    }
    
    print("\(forRGB()) \(forRB())")
}

solution()