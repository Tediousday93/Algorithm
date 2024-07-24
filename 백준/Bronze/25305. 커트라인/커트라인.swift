let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
var k = nk[1]
var points: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
points.sort(by: <)
while k > 1 {
    points.removeLast()
    k -= 1
}
print(points.last!)