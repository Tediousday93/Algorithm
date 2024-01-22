let N = Int(readLine()!)!
var R: [Int] = []
var G: [Int] = []
var B: [Int] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    R.append(input[0])
    G.append(input[1])
    B.append(input[2])
}
var D: [[Int]] = .init(
    repeating: .init(repeating: 0, count: 3),
    count: N+1
)
D[1][0] = R[0]
D[1][1] = G[0]
D[1][2] = B[0]

for i in stride(from: 2, through: N, by: 1) {
    D[i][0] = min(D[i-1][1], D[i-1][2]) + R[i-1]
    D[i][1] = min(D[i-1][0], D[i-1][2]) + G[i-1]
    D[i][2] = min(D[i-1][0], D[i-1][1]) + B[i-1]
}

print(D[N].min()!)