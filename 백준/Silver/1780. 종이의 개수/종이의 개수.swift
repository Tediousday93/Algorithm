let N = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<N {
    let list = readLine()!.split(separator: " ").compactMap { Int($0)! + 1 }
    board.append(list)
}
var result: [Int] = .init(repeating: 0, count: 3)

func checkPaper(r: Int, c: Int, n: Int) -> Bool {
    let first = board[r][c]
    for i in r..<r+n {
        for j in c..<c+n {
            if board[i][j] != first {
                return false
            }
        }
    }
    return true
}

func devide(r: Int, c: Int, n: Int) {
    if checkPaper(r: r, c: c , n: n) {
        result[board[r][c]] += 1
    } else {
        let size = n / 3
        for i in 0..<3 {
            for j in 0..<3 {
                devide(r: r + size * i, c: c + size * j, n: size)
            }
        }
    }
}

devide(r: 0, c: 0, n: N)
print("\(result[0])\n\(result[1])\n\(result[2])")