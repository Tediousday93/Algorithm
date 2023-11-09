var left = readLine()!
var right = ""
let commandCount = Int(readLine()!)!

for _ in 1...commandCount {
    let command = readLine()!
    switch command.first {
    case "L":
        guard left.isEmpty == false else {
            break
        }
        `right`.append(left.popLast()!)
    case "D":
        guard `right`.isEmpty == false else {
            break
        }
        left.append(`right`.popLast()!)
    case "B":
        guard left.isEmpty == false else {
            break
        }
        left.removeLast()
    case "P":
        left.append(command.last!)
    default: break
    }
}

print(left + `right`.reversed())