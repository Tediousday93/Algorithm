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
var sortedKeys = occurs.sorted(by: {
    if $0.value != $1.value {
        return $0.value > $1.value
    } else {
        return orders[$0.key]! < orders[$1.key]!
    }
    
}).map { $0.key }

for key in sortedKeys {
    for _ in 0..<occurs[key]! {
        ans += key + " "
    }
}

ans.removeLast()
print(ans)