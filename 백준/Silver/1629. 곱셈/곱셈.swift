let ABC = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ABC[0]
let b = ABC[1]
let c = ABC[2]

func powMod(x: Int, y: Int, z: Int) -> Int {
    if y == 1 { return x % z }
    var tmp = powMod(x: x, y: y/2, z: z)
    tmp = tmp * tmp % z
    
    if y % 2 == 1 {
        return tmp * x % z
    } else {
        return tmp
    }
}

print(powMod(x: a, y: b, z: c))