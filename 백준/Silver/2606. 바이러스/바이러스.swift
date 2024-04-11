func solution() {
    let computerCount = Int(readLine()!)!
    let edgeCount = Int(readLine()!)!
    
    var graph: [[Int]] = .init(repeating: [], count: computerCount + 1)
    for _ in 0..<edgeCount {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    var vis: [Bool] = .init(repeating: false, count: computerCount + 1)
    vis[0] = true
    
    var answer = -1
    
    func dfs(node: Int) {
        if vis[node] { return }
        answer += 1
        vis[node] = true
        
        for next in graph[node] {
            dfs(node: next)
        }
    }
    
    dfs(node: 1)
    print(answer)
}
solution()