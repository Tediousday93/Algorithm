import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let unique: Set<Int> = Set(lottos)
    let matched = unique.intersection(win_nums).count
    let canBeMatched = lottos.filter({ $0 == 0 }).count
    
    func getRank(matchedCount: Int) -> Int {
        switch matchedCount {
        case 6:
            return 1
        case 5:
            return 2
        case 4:
            return 3
        case 3:
            return 4
        case 2:
            return 5
        default:
            return 6
        }
    }
    
    let minRank = getRank(matchedCount: matched)
    let maxRank = getRank(matchedCount: matched + canBeMatched)
    
    return [maxRank, minRank]
}