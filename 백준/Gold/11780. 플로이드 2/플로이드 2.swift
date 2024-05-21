let n = Int(readLine()!)!
let m = Int(readLine()!)!
let maxCost = Int.max / 2
var dist: [[Int]] = .init(
    repeating: [Int](repeating: maxCost, count: n+1),
    count: n+1
)
var next: [[Int]] = .init(
    repeating: [Int](repeating: -1, count: n+1),
    count: n+1
)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (start, end, cost) = (input[0], input[1], input[2])
    dist[start][end] = min(cost, dist[start][end])
    next[start][end] = end
}

for i in 1...n {
    dist[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            let new = dist[i][k] + dist[k][j]
            if dist[i][j] > new {
                dist[i][j] = new
                next[i][j] = next[i][k]
            }
        }
    }
}

var distAns: [String] = []
var pathAns: [String] = []

for i in 1...n {
    var distLine: [String] = []

    for j in 1...n {
        distLine.append(getCost(from: i, to: j))
        pathAns.append(getPath(from: i, to: j))
    }
    distAns.append(distLine.joined(separator: " "))
}

print(distAns.joined(separator: "\n") + "\n" + pathAns.joined(separator: "\n"))

func getCost(from i: Int, to j: Int) -> String {
    let cost: Int
    if dist[i][j] == maxCost {
        cost = 0
    } else {
        cost = dist[i][j]
    }
    return String(cost)
}

func getPath(from i: Int, to j: Int) -> String {
    if i == j || dist[i][j] == maxCost { return "0" }
    var cur = i
    var path: [String] = [String(i)]

    while cur != j {
        cur = next[cur][j]
        path.append(String(cur))
    }

    return "\(path.count) \(path.joined(separator: " "))"
}