struct EdgeInfo: Equatable {
    let cost: Int
    let node1: Int
    let node2: Int
}

let VE = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = VE[0]
let e = VE[1]
let nodes: [Int] = .init(1...v)
var edges: [EdgeInfo] = []

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let edgeInfo = EdgeInfo(cost: input[2], node1: input[0], node2: input[1])
    edges.append(edgeInfo)
}

func kruskal(nodes: [Int], edges: [EdgeInfo]) -> [EdgeInfo] {
    var resultEdges: [EdgeInfo] = []
    var edges = edges.sorted { $0.cost > $1.cost }
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
            if rank[rootX] == rank[rootY] {
                rank[rootX]! += 1
            }
        }
    }

    while resultEdges.count < (nodes.count - 1) {
        let edge = edges.removeLast()
        if find(edge.node1) != find(edge.node2) {
            union(edge.node1, edge.node2)
            resultEdges.append(edge)
        }
    }

    return resultEdges
}

let mstEdges = kruskal(nodes: nodes, edges: edges)
print(mstEdges.reduce(0, { $0 + $1.cost }))