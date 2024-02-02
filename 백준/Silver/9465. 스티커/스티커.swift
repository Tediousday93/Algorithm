var testCount = Int(readLine()!)!

while testCount != 0 {
    let column = Int(readLine()!)!

    var points: [[Int]] = []
    for _ in 0..<2 {
        points.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }

    var d: [[Int]] = .init(repeating: [0, 0], count: column+1)
    d[1] = [points[0][0], points[1][0]]

    for column in stride(from: 2, through: column, by: 1) {
        d[column][0] = max(
            d[column - 1][1]+points[0][column - 1],
            d[column - 2].max()!+points[0][column - 1]
        )
        d[column][1] = max(
            d[column - 1][0]+points[1][column - 1],
            d[column - 2].max()!+points[1][column - 1]
        )
    }

    print(d[column].max()!)
    testCount -= 1
}