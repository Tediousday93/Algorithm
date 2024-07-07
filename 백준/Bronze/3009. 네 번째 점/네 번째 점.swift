let a = readLine()!.split(separator: " ").compactMap { Int($0) }
let b = readLine()!.split(separator: " ").compactMap { Int($0) }
let c = readLine()!.split(separator: " ").compactMap { Int($0) }
var last = ""
for i in 0...1 {
    let coordinate: Int
    if a[i] == b[i] {
        coordinate = c[i]
    } else if b[i] == c[i] {
        coordinate = a[i]
    } else {
        coordinate = b[i]
    }
    last += "\(coordinate) "
}
print(last)