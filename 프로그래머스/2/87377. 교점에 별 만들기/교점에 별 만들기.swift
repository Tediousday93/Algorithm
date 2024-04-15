import Foundation

func solution(_ line:[[Int]]) -> [String] {
    func meetPoint(line1: [Int], line2: [Int]) -> (x: Int, y: Int)? {
        let (A, B, C, D, E, F) = (line1[0], line1[1], line2[0], line2[1], line1[2], line2[2])
        let xNumerator = B*F - E*D
        let denomiator = A*D - B*C
        let yNumerator = E*C - A*F
        
        if denomiator == 0 { return nil }
        if xNumerator % denomiator != 0  || yNumerator % denomiator != 0 { return nil }
        
        return (xNumerator / denomiator, yNumerator / denomiator)
    }
    
    var meetPoints: [(x: Int, y: Int)] = []
    var maxX: Int? = nil
    var maxY: Int? = nil
    var minX: Int? = nil
    var minY: Int? = nil
    
    for i in 0..<line.count {
        for j in i+1..<line.count {
            if let meetPoint = meetPoint(line1: line[i], line2: line[j]) {
                if let maximum = maxX, let minimum = minX {
                    maxX = max(maximum, meetPoint.x)
                    minX = min(minimum, meetPoint.x)
                } else {
                    maxX = meetPoint.x
                    minX = meetPoint.x
                }
                if let maximum = maxY, let minimum = minY {
                    maxY = max(maximum, meetPoint.y)
                    minY = min(minimum, meetPoint.y)
                } else {
                    maxY = meetPoint.y
                    minY = meetPoint.y
                }
                meetPoints.append(meetPoint)
            }
        }
    }
    
    var xIndices: [Int: Int] = [:]
    var yIndices: [Int: Int] = [:]
    stride(from: minX!, through: maxX!, by: 1).enumerated()
        .forEach { index, x in
            xIndices[x] = index
        }
    stride(from: maxY!, through: minY!, by: -1).enumerated()
        .forEach { index, y in
            yIndices[y] = index
        }
    var arr: [[String]] = .init(
        repeating: .init(repeating: ".", count: maxX! - minX! + 1),
        count: maxY! - minY! + 1
    )
    
    for meetPoint in meetPoints {
        let x = xIndices[meetPoint.x]!
        let y = yIndices[meetPoint.y]!
        arr[y][x] = "*"
    }
    
    return arr.map { $0.joined() }
}