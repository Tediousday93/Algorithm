let length: Int = Int(readLine()!)!
let arr: [Int] = readLine()!.split(separator:" ").map { Int($0)! }
let x: Int = Int(readLine()!)!
var count: Int = 0
for n in arr {
    if n == x {
        count += 1
    }
}
print(count)