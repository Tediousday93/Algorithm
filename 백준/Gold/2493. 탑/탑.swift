let n = Int(readLine()!)!
let height = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var tower: [(Int, Int)] = [(100000001, 0)]

for i in 1...n {
    let h = height[i-1]
    
    while tower.last!.0 < h {
        tower.removeLast()
    }
    print(tower.last!.1, terminator: " ")
    tower.append((h, i))
}