let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var hour = input[0], minute = input[1]

minute -= 45
if minute < 0 {
    hour -= 1
    minute += 60
}
if hour < 0 {
    hour += 24
}

print("\(hour) \(minute)")