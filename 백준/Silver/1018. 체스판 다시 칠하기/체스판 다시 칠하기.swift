let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var board: [[BoardColor]] = []

for _ in 0..<n {
    let line = readLine()!.compactMap { BoardColor(rawValue: String($0)) }
    board.append(line)
}

var count = Int.max
for i in 0...n-8 {
    for j in 0...m-8 {
        count = min(count,
                    redrawCount(at: (i, j), startColor: .white),
                    redrawCount(at: (i, j), startColor: .black))
    }
}
print(count)

enum BoardColor: String {
    case black = "B"
    case white = "W"

    func toggle() -> BoardColor {
        switch self {
            case .black: return .white
            case .white: return .black
        }
    }
}

func redrawCount(at point: (Int, Int), startColor: BoardColor) -> Int {
    let x = point.0, y = point.1
    var temp = board
    var redrawCount = 0

    if temp[x][y] != startColor {
        temp[x][y] = temp[x][y].toggle()
        redrawCount += 1
    }

    for i in y+1..<y+8 {
        if temp[x][i-1] == temp[x][i] {
            temp[x][i] = temp[x][i].toggle()
            redrawCount += 1
        }
    }

    for i in x+1..<x+8 {
        for j in y..<y+8 {
            if temp[i][j] == temp[i-1][j] {
                temp[i][j] = temp[i][j].toggle()
                redrawCount += 1
            }
        }
    }

    return redrawCount
}