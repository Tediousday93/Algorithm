var board: [[String]] = .init(
    repeating: .init(repeating: "", count: 15),
    count: 5
)
for i in 0..<5 {
    let input = readLine()!.map { String($0) }
    for j in 0..<input.count {
        board[i][j] = input[j]
    }
}
var word = ""
for i in 0..<15 {
    for j in 0..<5 {
        word += board[j][i]
    }
}
print(word)