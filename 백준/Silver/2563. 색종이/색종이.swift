var board: [[Int]] = .init(
    repeating: [Int](repeating: 0, count: 101),
    count: 101
)
let paperCount = Int(readLine()!)!
for _ in 0..<paperCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let x = input[0], y = input[1]
    for i in x..<x+10 {
        for j in y..<y+10 {
            board[i][j] = 1
        }
    }
}
let squareArea = board.map({ $0.reduce(0, +) }).reduce(0, +)
print(squareArea)