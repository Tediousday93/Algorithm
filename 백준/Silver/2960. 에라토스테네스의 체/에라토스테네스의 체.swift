let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
var k = nk[1]
var isDeleted: [Bool] = .init(repeating: false, count: n+1)
isDeleted[0] = true
isDeleted[1] = true

for num in 2...n {
    if isDeleted[num] { continue }

    for multiple in stride(from: num, through: n, by: num) {
        if isDeleted[multiple] { continue }
        k -= 1
        isDeleted[multiple] = true

        if k == 0 {
            print(multiple)
            break
        }
    }
}