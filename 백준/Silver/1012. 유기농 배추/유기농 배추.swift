let t = Int(readLine()!)!
for _ in 0..<t {
    solution()
}

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let m = input[0]
    let n = input[1]
    let k = input[2]
    var board: [[Int]] = .init(
        repeating: .init(repeating: 0, count: n),
        count: m
    )
    for _ in 0..<k {
        let xy = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        board[xy[0]][xy[1]] = 1
    }
    var vis: [[Bool]] = .init(
        repeating: .init(repeating: false, count: n),
        count: m
    )
    var stack: [(Int, Int)] = []
    var count: Int = 0
    let dx: [Int] = [1, 0, -1, 0]
    let dy: [Int] = [0, 1, 0, -1]
    
    for x in 0..<m {
        for y in 0..<n {
            if board[x][y] != 1 || vis[x][y] { continue }
            vis[x][y] = true
            stack.append((x, y))
            count += 1
            
            while !stack.isEmpty {
                let cur = stack.last!
                stack.removeLast()
                
                for i in 0...3 {
                    let nx = cur.0 + dx[i]
                    let ny = cur.1 + dy[i]
                    if !(0..<m ~= nx) || !(0..<n ~= ny) { continue }
                    if board[nx][ny] != 1 || vis[nx][ny] { continue }
                    vis[nx][ny] = true
                    stack.append((nx, ny))
                }
            }
        }
    }
    print(count)
}