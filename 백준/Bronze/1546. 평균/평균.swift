let n = Double(readLine()!)!
let points = readLine()!.split(separator: " ").compactMap { Double(String($0)) }

func modify(p: Double, max: Double) -> Double {
    p / max * 100
}

let mPoints = points.map { modify(p: $0, max: points.max()!) }
let result = mPoints.reduce(Double(0), +) / n
print(result)