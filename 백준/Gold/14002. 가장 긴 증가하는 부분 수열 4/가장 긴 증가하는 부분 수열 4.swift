let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
var d: [(Int, [Int])] = nums.map({ [$0] }).map({ (1, $0) })

for i in 0..<n {
    for j in 0..<i {
        if nums[i] > nums[j] {
            if d[j].0 + 1 > d[i].0 {
                d[i] = (d[j].0 + 1, d[j].1 + [nums[i]])
            }
        }
    }
}

let max = d.max(by: { $0.0 < $1.0 })!
print("\(max.0)\n\(max.1.map({ String($0) }).joined(separator: " "))")