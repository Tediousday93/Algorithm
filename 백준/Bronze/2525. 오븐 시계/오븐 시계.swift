let time = readLine()!.split(separator: " ").compactMap { Int($0) }
let cookingTime = Int(readLine()!)!
var hour = time[0], minute = time[1]
minute += cookingTime
hour += minute / 60
minute = minute % 60
if hour >= 24 {
    hour -= 24
}
print("\(hour) \(minute)")