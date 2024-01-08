let n = Int(readLine()!)!
var dict: [Int: Int] = [:]
for _ in 0..<n {
    let num = Int(readLine()!)!
    if let count = dict[num] {
        dict[num] = count + 1
    } else {
        dict[num] = 1
    }
}

let max = dict.max { lhs, rhs in
    var result = lhs.value < rhs.value
    if lhs.value == rhs.value {
        result = lhs.key > rhs.key
    }
    return result
}

print(max!.key)