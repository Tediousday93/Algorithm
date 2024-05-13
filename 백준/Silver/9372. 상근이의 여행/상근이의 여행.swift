typealias Edge = (cost: Int, node1: Int, node2: Int)

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
    let nodes: [Int] = .init(1...n)
    var edges: [Edge] = []

    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        edges.append((0, input[0], input[1]))
    }

    let mstEdges = kruskal(nodes: nodes, edges: edges)
    return String(mstEdges.count)
}

func kruskal(nodes: [Int], edges: [Edge]) -> [Edge] {
    var result: [Edge] = []
    var edges = edges
    var rank: [Int: Int] = [:]
    var parent: [Int: Int] = [:]

    for node in nodes {
        rank[node] = 0
        parent[node] = node
    }

    func find(_ node: Int) -> Int {
        if parent[node]! == node { return node }
        parent[node] = find(parent[node]!)
        return parent[node]!
    }

    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)

        if rootX == rootY { return }

        if rank[rootX]! < rank[rootY]! {
            parent[rootX] = rootY
        } else {
            parent[rootY] = rootX
            if rank[rootX]! == rank[rootY]! {
                rank[rootX]! += 1
            }
        }
    }

    while result.count < nodes.count - 1 {
        let edge = edges.removeLast()
        if find(edge.node1) != find(edge.node2) {
            union(edge.node1, edge.node2)
            result.append(edge)
        }
    }

    return result
}