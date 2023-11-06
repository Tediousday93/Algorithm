let length = Int(readLine()!)!
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let x = Int(readLine()!)!

var occur: [Int] = .init(repeating: 0, count: 2000000)

var result: Int = 0

for i in arr {
    if x - i > 0, occur[x - i - 1] == 1 {
        result += 1
    }
    
    occur[i - 1] += 1
}

print(result)