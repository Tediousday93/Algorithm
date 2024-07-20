let n = Int(readLine()!)!
var number = 666
var count = 1
while count < n {
    number += 1
    if has666(in: number) {
        count += 1
    }
}
print(number)

func has666(in num: Int) -> Bool {
    var cur = num
    while cur >= 666 {
        if (cur - 666) % 1000 == 0 {
            return true
        }
        cur /= 10
    }
    return false
}