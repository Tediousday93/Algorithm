let n = Int(readLine()!)!
var chatLog: Set<String> = []
var emojiCount = 0

for _ in 0..<n {
    let log = readLine()!
    if log == "ENTER" {
        emojiCount += chatLog.count
        chatLog.removeAll()
    } else {
        chatLog.insert(log)
    }
}
emojiCount += chatLog.count

print(emojiCount)