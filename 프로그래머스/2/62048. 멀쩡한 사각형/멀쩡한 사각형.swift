import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{    
    var answer = 0
    
    for row in 1...w {
        answer += (w - row) * h / w
    }
    
    return Int64(answer * 2)
}