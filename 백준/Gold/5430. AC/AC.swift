let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    result += test() + "\n"
}

print(result)

func test() -> String {
    let p = readLine()!.map { String($0) }
    let _ = readLine()
    let arr = readLine()!
        .split { ["[", ",", "]"].contains($0) }
        .compactMap { Int(String($0)) }
    let tp: TPArr = .init(arr: arr)
    
    for cmd in p {
        switch cmd {
        case "R":
            tp.R()
        case "D":
            if tp.isEmpty {
                return "error"
            }
            tp.D()
        default:
            break
        }
    }
    
    if tp.isEmpty {
        return "[]"
    }
    
    var result = "["
    
    if tp.isReversed {
        for idx in stride(from: tp.tail-1, through: tp.head, by: -1) {
            result += String(tp.arr[idx]) + ","
        }
        result.removeLast()
    } else {
        for idx in stride(from: tp.head, to: tp.tail, by: 1) {
            result += String(tp.arr[idx]) + ","
        }
        result.removeLast()
    }
    result += "]"

    return result
}

final class TPArr {
    var arr: [Int] = []
    var head: Int = 0
    var tail: Int = 0
    var isReversed: Bool = false
    
    init(arr: [Int]) {
        self.arr = arr
        self.tail = arr.count
    }

    var isEmpty: Bool {
        head >= tail
    }
    
    func push(x: Int) {
        arr.append(x)
        tail += 1
    }
    
    func D() {
        if isReversed {
            tail -= 1
        } else {
            head += 1
        }
    }
    
    func R() {
        isReversed.toggle()
    }
}