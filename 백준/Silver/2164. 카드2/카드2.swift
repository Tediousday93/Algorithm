var dat: [Int] = .init(repeating: -1, count: 1000005)
var head: Int = 0
var tail: Int = 0

let n = Int(readLine()!)!

for i in 1...n {
    dat[tail] = i
    tail += 1
}

var oc: Int = 1
while tail - head != 1 {
    if oc % 2 == 1 {
        head += 1
    } else {
        dat[tail] = dat[head]
        tail += 1
        head += 1
    }
    oc += 1
}

print(dat[head])