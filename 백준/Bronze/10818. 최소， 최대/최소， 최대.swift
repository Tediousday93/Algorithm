_ = readLine()
var arr = readLine()!.split(separator: " ").compactMap { Int($0) }
arr.sort { $0 < $1 }
print("\(arr.first!) \(arr.last!)")