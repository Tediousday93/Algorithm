let n = Int(readLine()!)!
var serials: [String] = []
for _ in 0..<n {
    serials.append(readLine()!)
}

func sorting(a: String, b: String) -> Bool {
    var result = a.count < b.count
    
    if a.count == b.count {
        let aNum = a.compactMap { Int(String($0)) }.reduce(0, +)
        let bNum = b.compactMap { Int(String($0)) }.reduce(0, +)
        
        result = aNum < bNum
        
        if aNum == bNum {
            result = a < b
        }
    }

    return result
}

serials
    .sorted(by: sorting(a:b:))
    .forEach { print($0) }
