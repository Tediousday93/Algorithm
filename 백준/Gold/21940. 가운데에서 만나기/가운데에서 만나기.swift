let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let INF = Int.max / 2
var dist: [[Int]] = .init(
    repeating: [Int](repeating: INF, count: n+1),
    count: n+1
)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (a, b, t) = (input[0], input[1], input[2])
    dist[a][b] = min(dist[a][b], t)
}
for i in 1...n {
    dist[i][i] = 0
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            let new = dist[i][k] + dist[k][j]
            if new < dist[i][j] {
                dist[i][j] = new
            }
        }
    }
}

let _ = Int(readLine()!)!
let cities = readLine()!.split(separator: " ").compactMap { Int($0) }
var roundTripDist: [Int: [Int]] = [:]

for target in 1...n {
    cities.forEach { city in
                    roundTripDist[target, default: []].append(getRoundTripDistances(from: city, to: target))
                   }
}

var answers: [Int] = []
var minimumDist = Int.max

for (city, distances) in roundTripDist {
    if let max = distances.max() {
        if max < minimumDist {
            minimumDist = max
            answers = [city]
        } else if max == minimumDist {
            answers.append(city)
        }
    }
}

answers.sort(by: <)
print(answers.map(String.init).joined(separator:" "))

func getRoundTripDistances(from city: Int, to target: Int) -> Int {
    if city == target { return 0 }
    return dist[city][target] + dist[target][city]
}