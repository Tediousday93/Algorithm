let n = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").compactMap { Int($0) }
var costPerLiter = readLine()!.split(separator: " ").compactMap { Int($0) }
costPerLiter.removeLast()
for i in 0..<n-2 {
    var next = i + 1
    if costPerLiter[i] >= costPerLiter[next] { continue }
    
    while next < n-1, costPerLiter[i] < costPerLiter[next] {
        costPerLiter[next] = costPerLiter[i]
        next += 1
    }
}

var cost = 0
for i in 0..<n-1 {
    cost += distance[i] * costPerLiter[i]
}
print(cost)