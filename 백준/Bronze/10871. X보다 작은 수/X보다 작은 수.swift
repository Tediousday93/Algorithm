let nx = readLine()!.split(separator: " ").compactMap { Int($0) }
let x = nx[1]
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
let ans = arr.filter { $0 < x }
    .map(String.init)
    .joined(separator: " ")
print(ans)