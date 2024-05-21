typealias Edge = (start: Int, destination: Int, cost: Int)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let maxCost = Int.max / 2
var dist: [[Int]] = .init(
    repeating: [Int](repeating: maxCost, count: n),
    count: n
)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let edge: Edge = (input[0] - 1, input[1] - 1, input[2])
    dist[edge.start][edge.destination] = min(
        dist[edge.start][edge.destination],
        edge.cost
    )
}
for i in 0..<n {
    dist[i][i] = 0
}

func floyd() {
    for x in 0..<n {
        for y in 0..<n {
            for z in 0..<n {
                let new = dist[y][x] + dist[x][z]
                if dist[y][z] > new {
                    dist[y][z] = new
                }
            }
        }
    }
}

floyd()
var answer = ""
for i in 0..<n {
    var line: [String] = []
    for j in 0..<n {
        let cost: Int
        if dist[i][j] == maxCost {
            cost = 0
        } else {
            cost = dist[i][j]
        }
        line.append(String(cost))
    }
    answer += line.joined(separator: " ") + "\n"
}

print(answer)