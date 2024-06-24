let pieceCount: [Int] = [1, 1, 2, 2, 2, 8]
let currentPiece = readLine()!.split(separator: " ").compactMap { Int($0) }
var ans = ""
for i in 0..<6 {
    ans += "\(pieceCount[i] - currentPiece[i]) "
}
print(ans)