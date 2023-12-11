let ABC = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ABC[0]
let b = ABC[1]
let c = ABC[2]

print((a+b)%c)
print(((a%c) + (b%c))%c)
print((a*b)%c)
print(((a%c) * (b%c))%c)