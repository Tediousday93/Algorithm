var s = readLine()!
let startingChar: Character = s.last!
var count: Int = 0

var cur = startingChar
while let char = s.popLast() {
    if char != cur {
        if char != startingChar { count += 1 }
        cur = char
    }
}

print(count)