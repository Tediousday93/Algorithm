let testCount = Int(readLine()!)!
var result: [String] = []

for _ in 0..<testCount {
    result.append(excuteTest())
}

print(result.joined(separator: "\n"))

func excuteTest() -> String {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]
    var parents: [Int] = .init(0...n)
    var rank: [Int] = .init(repeating: 0, count: n+1)
    var ans = 0

    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        if find(input[0], parents: &parents) != find(input[1], parents: &parents) {
            union(input[0], input[1], parents: &parents, rank: &rank)
            ans += 1
        }
    }

    return String(ans)
}

func find(_ node: Int, parents: inout [Int]) -> Int {
    if parents[node] == node { return node }
    parents[node] = find(parents[node], parents: &parents)
    return parents[node]
}

func union(_ x: Int, _ y: Int, parents: inout [Int], rank: inout [Int]) {
    let rootX = find(x, parents: &parents)
    let rootY = find(y, parents: &parents)

    if rootX == rootY { return }

    if rank[rootX] < rank[rootY] {
        parents[rootX] = rootY
    } else {
        parents[rootY] = rootX
        if rank[rootX] == rank[rootY] {
            rank[rootX] += 1
        }
    }
}