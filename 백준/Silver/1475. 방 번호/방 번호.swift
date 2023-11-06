let input = readLine()!.map { String($0) }
var occur: [Int] = .init(repeating: 0, count: 9)

for n in input {
    if n == "9" {
        occur[6] += 1
    } else {
        occur[Int(n)!] += 1
    }
}

let sixNine = occur.remove(at: 6)
let sixNineSet = (sixNine / 2) + (sixNine % 2)
let setNum = occur.max()!

print(max(sixNineSet, setNum))