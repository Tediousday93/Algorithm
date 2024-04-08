import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    func isPrime(number: Int) -> Bool {
        guard number != 1 else { return false }
        
        var dividing = 2
        while dividing * dividing <= number {
            if number % dividing == 0 { return false }
            dividing += 1
        }
        
        return true
    }
    
    for i in 0..<nums.count {
        for j in stride(from: i+1, to: nums.count, by: 1) {
            for k in stride(from: j+1, to: nums.count, by: 1) {
                let num = nums[i] + nums[j] + nums[k]
                if isPrime(number: num) { answer += 1 }
            }
        }
    }

    return answer
}