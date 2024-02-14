let flowerCount = Int(readLine()!)!
var bloomingRanges: [(startMonth: Int, startDay: Int, endMonth: Int, endDay: Int)] = []

for _ in 0..<flowerCount {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    if (input[2], input[3]) <= (3, 1) || (input[0], input[1]) > (11, 30) {
        continue
    }

    bloomingRanges.append(
        (input[0], input[1], input[2], input[3])
    )
}

bloomingRanges.sort { lhs, rhs in
                     (lhs.0, lhs.1, rhs.2, rhs.3) < (rhs.0, rhs.1, lhs.2, lhs.3)
                    }

var selectedRange: [(start: (month: Int, day: Int), end: (month: Int, day: Int))] = [(start: (1, 1), end: (3, 1))]
var count: Int = 0

for bloomingRange in bloomingRanges {
    let startDate = (bloomingRange.startMonth, bloomingRange.startDay)
    let endDate = (bloomingRange.endMonth, bloomingRange.endDay)

    guard selectedRange.count > 1 else {
        if startDate > (3, 1) { continue }
        
        selectedRange.append((startDate, endDate))
        count += 1
        continue
    }

    if selectedRange[count].end < startDate { continue }
    if selectedRange[count].end >= endDate { continue }

    if startDate <= selectedRange[count-1].end,
    selectedRange[count].end < endDate {
        selectedRange[count] = (startDate, endDate)
    } else {
        count += 1
        selectedRange.append((startDate, endDate))
    }

    if endDate > (11, 30) { break }
}

if selectedRange.last!.end <= (11, 30) {
    count = 0
}

print(count)