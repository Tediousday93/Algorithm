let N = Int(readLine()!)!

func recursive(n: Int) -> [String] {
    if n == 3 { return ["  *  ", " * * ", "*****"] }
    
    let cell = recursive(n: n/2)
    let space = String(repeating: " ", count: n/2)
    var newCell = [String]()
    
    cell.forEach { newCell.append(space + $0 + space) }
    cell.forEach { newCell.append($0 + " " + $0) }
    
    return newCell
}

let stars = recursive(n: N)
print(stars.joined(separator: "\n"))