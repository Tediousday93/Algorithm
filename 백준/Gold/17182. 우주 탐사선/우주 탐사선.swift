let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let start = nk[1]
var adj: [[Int]] = []
var toVisit: [Int] = []

for i in 0..<n {
    if i != start { toVisit.append(i) }
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    adj.append(input)
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            let new = adj[i][k] + adj[k][j]
            if new < adj[i][j] {
                adj[i][j] = new
            }
        }
    }
}

var answer: Int = .max
var routeList = permutation(of: toVisit, n: toVisit.count)
while let route = routeList.popLast() {
    var temp = adj[start][route[0]]
    for i in stride(from: 1, to: toVisit.count, by: 1) {
        temp += adj[route[i-1]][route[i]]
    }
    answer = min(answer, temp)
}

print(answer)

func permutation(of array: [Int], n: Int) -> [[Int]] {
    var result: [[Int]] = []
    if array.count < n { return result }

    var visited: [Bool] = .init(repeating: false, count: array.count)

    func permute(_ now: [Int]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] { continue }
            visited[i] = true
            permute(now + [array[i]])
            visited[i] = false
        }
    }
    permute([])

    return result
}