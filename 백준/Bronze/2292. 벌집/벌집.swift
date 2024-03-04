let n = Int(readLine()!)!
var circle = 0
var start = 0
var end = 0

while !(start...end).contains(n-1) {
    circle += 1
    start = end + 1
    end = (start - 1) + (6 * circle)
}

print(circle + 1)