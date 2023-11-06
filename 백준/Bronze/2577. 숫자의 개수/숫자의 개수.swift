let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!
let n = String(a * b * c).map { String($0) }

var occur: [Int] = .init(repeating: 0, count: 10)

for num in n {
    occur[Int(num)!] += 1
}

for i in occur {
    print(i)
}