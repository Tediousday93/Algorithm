let nmr = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
let INF = Int.max / 2

var itemCount: [Int] = [0]
itemCount += readLine()!.split(separator: " ").compactMap { Int($0) }

var distance: [[Int]] = .init(
    repeating: [Int](repeating: INF, count: n+1),
    count: n+1
)
for _ in 0..<r {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (a, b, l) = (input[0], input[1], input[2])
    distance[a][b] = min(distance[a][b], l)
    distance[b][a] = min(distance[b][a], l)
}
for i in 1...n {
    distance[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            let new = distance[i][k] + distance[k][j]
            if new < distance[i][j] {
                distance[i][j] = new
            }
        }
    }
}

var gettableItemCount: [Int] = []

for x in 1...n {
    var count = 0
    for y in 1...n {
        if distance[x][y] <= m {
            count += itemCount[y]
        }
    }

    gettableItemCount.append(count)
}

print(gettableItemCount.max()!)