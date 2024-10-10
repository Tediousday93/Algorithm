let n = Int(readLine()!)!
var graph: [[Int]] = []
for x in 0..<n {
    graph.append(readLine()!.compactMap({ Int(String($0)) }))
}
var vis: [[Bool]] = .init(repeating: [Bool](repeating: false, count: n), count: n)
var houseCounts: [Int] = []

for x in 0..<n {
    for y in 0..<n {
        if graph[x][y] == 0 || vis[x][y] { continue }
        dfs(startAt: (x, y))
    }
}

houseCounts.sort()
print("\(houseCounts.count)\n\(houseCounts.map(String.init).joined(separator: "\n"))")

func dfs(startAt coordinate: (Int, Int)) {
    var stack: [(Int, Int)] = []
    stack.append(coordinate)
    vis[coordinate.0][coordinate.1] = true

    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    var houseCount = 0

    while let cur = stack.popLast() {
        houseCount += 1

        for i in 0..<4 {
            let nx = cur.0 + dx[i]
            let ny = cur.1 + dy[i]

            if !(0..<n ~= nx) || !(0..<n ~= ny) { continue }
            if graph[nx][ny] == 0 || vis[nx][ny] { continue }
            vis[nx][ny] = true
            stack.append((nx, ny))
        }
    }
    houseCounts.append(houseCount)
}