let N = Int(readLine()!)!

func recursive(n: Int) -> [String] {
    if n == 1 { return ["*"] }
    
    let cell = recursive(n: n/3)
    let space = String.init(repeating: " ", count: n/3)
    var newCell: [String] = []
    
    cell.forEach { newCell.append($0+$0+$0) }
    cell.forEach { newCell.append($0+space+$0) }
    cell.forEach { newCell.append($0+$0+$0) }
    
    return newCell
}

let stars = recursive(n: N)
print(stars.joined(separator: "\n"))
