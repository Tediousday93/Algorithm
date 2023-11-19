import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}

let fileIO = FileIO()
var dat: [Int] = .init(repeating: -1, count: 2000005)
var head: Int = 0
var tail: Int = 0

let n = fileIO.readInt()
var result: String = ""

for _ in 0..<n {
    let c = fileIO.readString()
    switch c {
    case 448:
        dat[tail] = fileIO.readInt()
        tail += 1
    case 335:
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(dat[head])\n"
            head += 1
        }
    case 443:
        result += "\(tail - head)\n"
    case 559:
        result += "\(head == tail ? 1 : 0)\n"
    case 553:
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(dat[head])\n"
        }
    case 401:
        if head == tail {
            result += "-1\n"
        } else {
            result += "\(dat[tail-1])\n"
        }
    default :
        break
    }
}

print(result)