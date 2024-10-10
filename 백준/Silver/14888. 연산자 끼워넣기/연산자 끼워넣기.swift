let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var operatorCounts = readLine()!.split(separator: " ").compactMap { Int($0) }
var maxValue = Int.min
var minValue = Int.max

func dfs(d: Int, cur: Int) {
    if d == n {
        maxValue = max(maxValue, cur)
        minValue = min(minValue, cur)
        return
    }
    
    for i in 0..<4 {
        if operatorCounts[i] == 0 {
            continue
        }
        
        operatorCounts[i] -= 1
        switch i {
        case 0:
            dfs(d: d + 1, cur: cur + numbers[d])
        case 1:
            dfs(d: d + 1, cur: cur - numbers[d])
        case 2:
            dfs(d: d + 1, cur: cur * numbers[d])
        case 3:
            dfs(d: d + 1, cur: cur / numbers[d])
        default:
            break
        }
        operatorCounts[i] += 1
    }
}

dfs(d: 1, cur: numbers[0])
print("\(maxValue)\n\(minValue)")