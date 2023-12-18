let N = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<N {
    let tmp = readLine()!.compactMap { Int(String($0)) }
    board.append(tmp)
}
var result: [Int] = .init(repeating: 0, count: 2)

func recursive(x: Int, y: Int, size: Int) {
    if size == 0 { return }
    
    if check(x: x, y: y, size: size) {
        result[board[x][y]] += 1
    } else {
        let dx: [Int] = [0, 0, size/2, size/2]
        let dy: [Int] = [0, size/2, 0, size/2]
        for i in 0..<4 {
            recursive(x: x+dx[i], y: y+dy[i], size: size/2)
        }
    }
}

private func check(x: Int, y: Int, size: Int) -> Bool {
    let first = board[x][y]
    for i in x..<x+size {
        for j in y..<y+size {
            if board[i][j] != first {
                return false
            }
        }
    }
    return true
}

recursive(x: 0, y: 0, size: N)
print("\(result[0])\n\(result[1])")