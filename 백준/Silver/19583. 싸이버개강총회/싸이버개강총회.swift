let SEQ = readLine()!.split(separator: " ").map { String($0) }
let startTime = SEQ[0]
let endTime = SEQ[1]
let quiteStreamingTime = SEQ[2]
var attendingMembers: Set<String> = []
var leavedMembers: Set<String> = []

while let input = readLine(), input != "" {
    let log = input.split(separator: " ").map(String.init)

    switch log[0] {
        case ...startTime:
        attendingMembers.insert(log[1])
        case endTime...quiteStreamingTime:
        leavedMembers.insert(log[1])
        default:
        break
    }
}

print(attendingMembers.intersection(leavedMembers).count)