let n = Int(readLine()!)!
let nodes: [Int] = .init(1...n)
var edges: [(cost: Int, node1: Int, node2: Int)] = []

for node1 in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for node2 in 0..<n {
        if node1 == node2 { continue }
        edges.append((cost: input[node2], node1: node1 + 1, node2: node2 + 1))
    }
}

let unionResult = kruskal(nodes: nodes, edges: edges)
print(unionResult.reduce(0, { $0 + $1.cost }))

func kruskal(
    nodes: [Int],
    edges: [(cost: Int, node1: Int, node2: Int)]
) -> [(cost: Int, node1: Int, node2: Int)] {
    var resultFlows: [(cost: Int, node1: Int, node2: Int)] = []
    var edges = edges.sorted(by: >)
    var parent: [Int: Int] = [:]
    var rank: [Int: Int] = [:]

    for node in nodes {
        parent[node] = node
        rank[node] = 0
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

    while resultFlows.count < nodes.count - 1 {
        let edge = edges.removeLast()
        if find(edge.node1) != find(edge.node2) {
            union(edge.node1, edge.node2)
            resultFlows.append(edge)
        }
    }

    return resultFlows
}