import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result: [Int] = []
    var scoreIndex = 0
    var scoresToCheck: [Int] = []
    
    while true {
        if scoreIndex >= score.count { break }
        
        scoresToCheck.append(score[scoreIndex])
        scoreIndex += 1
        scoresToCheck.sort(by: { $0 > $1 })
        
        if scoreIndex <= k {
            result.append(scoresToCheck.min()!)
        } else {
            result.append(scoresToCheck[k-1])
        }
    }
    
    return result
}