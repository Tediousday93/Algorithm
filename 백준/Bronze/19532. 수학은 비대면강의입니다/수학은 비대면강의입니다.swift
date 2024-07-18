let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = input[0], b = input[1], c = input[2]
let d = input[3], e = input[4], f = input[5]
let x = (c*e - b*f) / (a*e - b*d)
let y = (c*d - a*f) / (b*d - a*e)
print("\(x) \(y)")