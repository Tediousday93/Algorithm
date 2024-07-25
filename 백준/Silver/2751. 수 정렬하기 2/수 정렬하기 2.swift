let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()
print(arr.map({ String($0) }).joined(separator: "\n"))