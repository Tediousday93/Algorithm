let T = Int(readLine()!)!
var ans = ""

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    ans += "\(combination(n: input[1], r: input[0]))\n"
}

print(ans)

func combination(n: Int, r: Int) -> Int {
    var result = 1
    
    for i in 0..<r {
        result *= n - i
        result /= i + 1
    }
    
    return result
}