let meetingCount = Int(readLine()!)!
var meetingTimes: [(Int, Int)] = []
for _ in 0..<meetingCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetingTimes.append((input[0], input[1]))
}
meetingTimes.sort(by: { $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 })

var ans: Int = 0
var prevEndTime = 0
for meetingTime in meetingTimes {
    if prevEndTime > meetingTime.0 {
        continue
    }

    ans += 1
    prevEndTime = meetingTime.1
}

print(ans)