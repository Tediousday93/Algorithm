let lectureCount = Int(readLine()!)!
var lectures: [(time: Int, count: Int)] = []

for _ in 0..<lectureCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    lectures.append((input[0], 1))
    lectures.append((input[1], -1))
}
lectures.sort { $0.time < $1.time }

var roomCount: Int = 0
var currentTime = lectures[0].time
var openedLectureCount: Int = 0
var index: Int = 0

while true {
    while (index < 2 * lectureCount) && (lectures[index].time == currentTime) {
        openedLectureCount += lectures[index].count
        index += 1
    }

    roomCount = max(roomCount, openedLectureCount)
    if index == 2 * lectureCount { break }
    currentTime = lectures[index].time
}

print(roomCount)