let nc = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nc[0]
let c = nc[1]
var orders: [String: Int] = [:]
var occurs: [String: Int] = [:]

let input = readLine()!.split(separator: " ").map { String($0) }
var cur = 0
for i in 0..<n {
    if orders[input[i]] == nil {
        orders[input[i]] = cur
        cur += 1
    }
    occurs[input[i], default: 0] += 1
}

var ans: String = ""
occurs.sorted { $0.value != $1.value ? ($0.value > $1.value) : (orders[$0.key]! < orders[$1.key]!) }
    .map { $0.key }
    .forEach {
        for _ in 0..<occurs[$0]! {
            ans += $0 + " "
        }
    }

print(ans)