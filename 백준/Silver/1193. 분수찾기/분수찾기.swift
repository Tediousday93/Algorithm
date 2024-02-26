let x = Int(readLine()!)!
var fractions: [(Int, Int)] = []
var line = 0

while fractions.count < x {
    line += 1

    var cur = 0
    var pair: Int { line - cur }

    if line % 2 == 0 {
        for num in 1...line {
            fractions.append((num, pair))
            cur += 1
        }
    } else {
        for num in 1...line {
            fractions.append((pair, num))
            cur += 1
        }
    }
}

print("\(fractions[x-1].0)/\(fractions[x-1].1)")