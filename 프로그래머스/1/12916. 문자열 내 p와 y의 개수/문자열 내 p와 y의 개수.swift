import Foundation

func solution(_ s:String) -> Bool
{
    var characterDict: [Character: Int] = [:]
    var ans: Bool = false
    
    for char in s {
        characterDict[char, default: 0] += 1
    }
    let pCount = characterDict["p", default: 0] + characterDict["P", default: 0]
    let yCount = characterDict["y", default: 0] + characterDict["Y", default: 0]
    ans = (pCount == yCount)
    return ans
}