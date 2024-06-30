let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let decimal = input[0], b = input[1]
var remains = decimal
var digitCount = 0
var converted: [String] = []
var degreeNumber = 1

while true {
    degreeNumber *= b
    digitCount += 1
    if decimal - degreeNumber < 0 { break }
}

remains = decimal

for _ in 0..<digitCount {
    var digitNumber = 0
    degreeNumber /= b
    digitNumber = remains / degreeNumber
    if digitNumber > 9 {
        let char = String(UnicodeScalar(digitNumber + 55)!)
        converted.append(char)
    } else {
        converted.append(String(digitNumber))
    }
    remains = decimal % degreeNumber
}

print(converted.joined())