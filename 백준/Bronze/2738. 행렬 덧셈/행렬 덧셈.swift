let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var arrA: [[Int]] = []
var arrB: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arrA.append(input)
}
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    arrB.append(input)
}
var ans: [String] = []
for i in 0..<n {
    var line = ""
    for j in 0..<m {
        line += "\(arrA[i][j] + arrB[i][j]) "
    }
    ans.append(line)
}
print(ans.joined(separator: "\n"))