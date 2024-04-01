import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{    
    var answer = 0
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a % b)
    }
    
    answer = w * h - (w + h - gcd(w, h))
    
    return Int64(answer)
}