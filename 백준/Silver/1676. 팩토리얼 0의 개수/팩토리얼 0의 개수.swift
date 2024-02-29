let n = Int(readLine()!)!
var multipleNum = n

var twoCount = 0
var fiveCount = 0

while multipleNum != 0 {
    let (two, five) = getCounts(n: multipleNum)
    twoCount += two
    fiveCount += five
    multipleNum -= 1
}

print(min(twoCount, fiveCount))

func getCounts(n: Int) -> (Int, Int) {
    var num = n
    var two = 0
    while num % 2 == 0 {
        two += 1
        num /= 2
    }
    var five = 0
    while num % 5 == 0 {
        five += 1
        num /= 5
    }

    return (two, five)
}