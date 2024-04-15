import Foundation

func solution(_ line:[[Int]]) -> [String] {
    func meetPoint(line1: [Int], line2: [Int]) -> (x: Int, y: Int)? {
        let xNumerator = line1[1]*line2[2] - line1[2]*line2[1]
        let xDenomiator = line1[0]*line2[1] - line1[1]*line2[0]
        let yNumerator = line1[2]*line2[0] - line1[0]*line2[2]
        let yDenomiator = line1[0]*line2[1] - line1[1]*line2[0]
        
        if xDenomiator == 0 || yDenomiator == 0 { return nil }
        if xNumerator % xDenomiator != 0  || yNumerator % yDenomiator != 0 { return nil }
        
        return (xNumerator / xDenomiator, yNumerator / yDenomiator)
    }
    
    var meetPoints: [(x: Int, y: Int)] = []
    var maxX: Int? = nil
    var maxY: Int? = nil
    var minX: Int? = nil
    var minY: Int? = nil
    
    for i in 0..<line.count {
        for j in i..<line.count {
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
    
    var xCoordinates: [Int: Int] = [:]
    var yCoordinates: [Int: Int] = [:]
    stride(from: minX!, through: maxX!, by: 1).enumerated()
        .forEach { index, x in
            xCoordinates[x] = index
        }
    stride(from: maxY!, through: minY!, by: -1).enumerated()
        .forEach { index, y in
            yCoordinates[y] = index
        }
    var arr: [[String]] = .init(
        repeating: .init(repeating: ".", count: maxX! - minX! + 1),
        count: maxY! - minY! + 1
    )
    
    for meetPoint in meetPoints {
        let x = xCoordinates[meetPoint.x]!
        let y = yCoordinates[meetPoint.y]!
        arr[y][x] = "*"
    }
    
    return arr.map { $0.joined() }
}