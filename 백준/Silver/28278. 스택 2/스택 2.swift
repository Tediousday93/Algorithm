enum Operation: Int {
    case push = 1
    case pop
    case count
    case isEmpty
    case top
}

var stack: [Int] = []
var ans = ""
let numberOfOperation = Int(readLine()!)!

for _ in 0..<numberOfOperation {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    ans += handle(input)
}

print(ans)

func handle(_ input: [Int]) -> String {
    var result = ""
    let terminator = "\n"
    let operation = Operation(rawValue: input[0])!

    switch operation {
        case .push:
        stack.append(input[1])
        case .pop:
        if let last = stack.popLast() {
            result = String(last) + terminator
        } else {
            result = String(-1) + terminator
        }
        case .count:
        result = String(stack.count) + terminator
        case .isEmpty:
        result = String(stack.isEmpty ? 1 : 0) + terminator
        case .top:
        if let last = stack.last {
            result = String(last) + terminator
        } else {
            result = String(-1) + terminator
        }
    }

    return result
}