let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]

var graph: [[Int]] = .init(repeating: [], count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

var vis: [Bool] = .init(repeating: false, count: n + 1)
var targets: [Int] = []
var maxDist = 0

func bfs() {
    var queue: [(Int, Int)] = []
    var pointer = 0
    queue.append((1, 0))
    vis[1] = true

    while queue.count > pointer {
        let (cur, dist) = queue[pointer]
        pointer += 1

        if maxDist < dist {
            maxDist = dist
            targets = [cur]
        } else if maxDist == dist {
            targets.append(cur)
        }

        for next in graph[cur] {
            if !vis[next] {
                queue.append((next, dist + 1))
                vis[next] = true
            }
        }
    }
}

bfs()
targets.sort(by: <)
print("\(targets.first!) \(maxDist) \(targets.count)")