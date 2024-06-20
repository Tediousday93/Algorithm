let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var arr: [Int] = .init(repeating: 0, count: n)
for _ in 0..<m {
    let ijk = readLine()!.split(separator: " ").compactMap { Int($0) }
    let i = ijk[0] - 1, j = ijk[1] - 1, k = ijk[2]
    for index in i...j {
        arr[index] = k
    }
}
print(arr.map(String.init).joined(separator: " "))