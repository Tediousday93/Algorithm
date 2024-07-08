let n = Int(readLine()!)!
var X: [Int] = []
var Y: [Int] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    X.append(input[0])
    Y.append(input[1])
}
print((X.max()! - X.min()!) * (Y.max()! - Y.min()!))