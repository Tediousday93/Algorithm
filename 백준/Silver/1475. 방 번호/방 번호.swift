let input = readLine()!.map { String($0) }
var occur: [Int] = .init(repeating: 0, count: 9)

for n in input {
    if n == "9" {
        occur[6] += 1
    } else {
        occur[Int(n)!] += 1
    }
}

let sixNineSet = (occur[6] / 2) + (occur[6] % 2)
occur[6] = sixNineSet
let setNum = occur.max()!

print(setNum)