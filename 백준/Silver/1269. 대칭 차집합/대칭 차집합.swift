_ = readLine()
var A: Set<Int> = Set(readLine()!.split(separator: " ").compactMap({ Int($0) }))
var B: Set<Int> = Set(readLine()!.split(separator: " ").compactMap({ Int($0) }))
print(A.subtracting(B).count + B.subtracting(A).count)