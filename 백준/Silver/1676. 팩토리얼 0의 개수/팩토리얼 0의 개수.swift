let n = Int(readLine()!)!
var multipleNum = n
var fiveCount = 0

while multipleNum != 0 {
    let five = getCounts(n: multipleNum)
    fiveCount += five
    multipleNum -= 1
}

print(fiveCount)

func getCounts(n: Int) -> Int {
    var num = n
    var five = 0
    while num % 5 == 0 {
        five += 1
        num /= 5
    }

    return five
}