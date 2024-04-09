import Foundation

func solution(_ s:String) -> Int {
    var minLength = s.count
    let alphabets = s.map { String($0) }
    var compressed = ""
    
    for compressLength in stride(from: 1, through: s.count / 2, by: 1) {
        var unit = ""
        var count = 0
        
        for index in stride(from: 0, to: s.count, by: compressLength) {
            var endIndex = index + compressLength
            
            if endIndex >= alphabets.count { endIndex = alphabets.count }
            
            let cur = alphabets[index..<endIndex].reduce("", +)
            
            if cur == unit {
                count += 1
            } else {
                compressed += ((count <= 1 ? "" : String(count)) + unit)
                unit = cur
                count = 1
            }
        }
        compressed += ((count <= 1 ? "" : String(count)) + unit)
        
        minLength = min(minLength, compressed.count)
        compressed = ""
    }
    
    return minLength
}