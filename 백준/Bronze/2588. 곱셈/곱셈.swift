let a = Int(readLine()!)!
let B = readLine()!
let b = Int(B)!
let numbers = B.compactMap { Int(String($0)) }
for n in numbers.reversed() {
    print(a*n)
}
print(a*b)