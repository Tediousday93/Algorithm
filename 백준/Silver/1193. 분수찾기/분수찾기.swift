var x = Int(readLine()!)!
var fractionLine = 1

while x > fractionLine {
    x -= fractionLine
    fractionLine += 1
}

if fractionLine % 2 == 0 {
    print("\(x)/\(fractionLine-x+1)")
} else {
    print("\(fractionLine-x+1)/\(x)")
}