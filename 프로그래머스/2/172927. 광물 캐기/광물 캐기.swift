import Foundation
func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    enum Mineral: String {
        case diamond
        case iron
        case stone
    }
    
    enum Pick {
        case diamond
        case iron
        case stone
        
        var fatigue: (Int, Int, Int) {
            switch self {
                case .diamond: return (1, 1, 1)
                case .iron: return (5, 1, 1)
                case .stone: return (25, 5, 1)
            }
        }
        
        func getFatigue(for mineral: Mineral) -> Int {
            switch mineral {
                case .diamond: return self.fatigue.0
                case .iron: return self.fatigue.1
                case .stone: return self.fatigue.2
            }
        }
    }
    
    var remainingPicks: [Int] = picks
    var fatigues: [Int] = []
    var backTrackingResult: [Int] = []
    
    func backTracking(index: Int) {
        if index >= minerals.count || remainingPicks.reduce(0, +) == 0 {
            fatigues.append(backTrackingResult.reduce(0, +))
            return
        }
        
        for pickIndex in 0...2 {
            var pick: Pick = .diamond
            
            switch pickIndex {
            case 1:
                pick = .iron
            case 2:
                pick = .stone
            default:
                break
            }
            
            if remainingPicks[pickIndex] > 0 {
                let endIndex = index + 5 > minerals.count ? minerals.count : index + 5
                
                remainingPicks[pickIndex] -= 1
                
                for mineralIndex in index..<endIndex {
                    let mineral = Mineral(rawValue: minerals[mineralIndex])!
                    backTrackingResult.append(pick.getFatigue(for: mineral))
                }
                backTracking(index: index + 5)
                backTrackingResult.removeLast(endIndex-index)
                remainingPicks[pickIndex] += 1
            }
        }
    }
    
    backTracking(index: 0)
    
    return fatigues.min()!
}