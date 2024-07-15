let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
let cards: [Int] = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .sorted { $0 < $1 }
var ans = 0
for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n {
           let sum = cards[i] + cards[j] + cards[k]
           if sum > m { break }
           if abs(sum - m) < abs(ans - m) { ans = sum }
        }
    }
}
print(ans)
