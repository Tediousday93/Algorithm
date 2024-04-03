import Foundation

func solution(_ board:[String]) -> Int {
    var oCount = 0
    var xCount = 0
    let flattenBoard = board.flatMap { $0.map(String.init) }
    flattenBoard.forEach { 
        switch $0 {
        case "O":
            oCount += 1
        case "X":
            xCount += 1
        default:
            break
        }
    }
    
    guard oCount >= xCount else { return 0 }
    guard oCount - xCount <= 1 else { return 0 }
    
    var mark = ""
    var hasWinner = false
    var result = 1
    
    let winningPosition: [(first: Int, second: Int, third: Int)] = [
        (0, 1 ,2), (3, 4, 5), (6, 7, 8), (0, 3, 6), 
        (1, 4, 7), (2, 5, 8), (0, 4, 8), (2, 4, 6)
    ]
    for indices in winningPosition {
        mark = flattenBoard[indices.first]
        hasWinner = (mark == flattenBoard[indices.second]) && (mark == flattenBoard[indices.third])
        
        if hasWinner, mark == "O" {
            if oCount == xCount { result = 0 }
        } else if hasWinner, mark == "X" {
            if oCount > xCount { result = 0 }
        }
    }
    
    return result
}