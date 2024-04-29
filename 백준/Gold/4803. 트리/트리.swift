var testCase = 0
var results: [String] = []

while let input = readLine(), input != "0 0" {
    testCase += 1
    let nm = input.split(separator: " ").compactMap { Int($0) }
    let n = nm[0]
    let m = nm[1]

    var graph: [[Int]] = .init(repeating: [], count: n+1)
    var vis: [Bool] = .init(repeating: false, count: n+1)
    var isTree = true

    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }

    func dfs(cur: Int, prev: Int) {
        for next in graph[cur] {
            if next == prev { continue }
            if vis[next] {
                isTree = false
                continue
            }

            vis[next] = true
            dfs(cur: next, prev: cur)
        }
    }

    var treeCount = 0

    for i in 1...n {
        if vis[i] { continue }
        vis[i] = true
        isTree = true
        dfs(cur: i, prev: -1)
        if isTree { treeCount += 1 }
    }

    var ans = "Case \(testCase): "

    switch treeCount {
        case 0:
        ans += "No trees."
        case 1:
        ans += "There is one tree."
        default:
        ans += "A forest of \(treeCount) trees."
    }

    results.append(ans)
}

print(results.joined(separator: "\n"))