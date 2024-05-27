enum Transportation: String {
    case mugunghwa = "Mugunghwa"
    case saemaeul = "ITX-Saemaeul"
    case cheongchun = "ITX-Cheongchun"
    case KTX
    case S_train = "S-Train"
    case V_train = "V-Train"
    case subway = "Subway"
    case bus = "Bus"
    case taxi = "Taxi"
    case airplane = "Airplane"
    case none
    
    var neailroFactor: Int {
        switch self {
        case .mugunghwa, .saemaeul, .cheongchun:
            return Int.max
        case .S_train, .V_train:
            return 2
        default:
            return 1
        }
    }
}

func solution() {
    let maxCost = Int.max / 2
    let nr = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = nr[0]
    let r = nr[1] * 2
    let cityNames = readLine()!.split(separator: " ").map { String($0) }
    var cityDict: [String: Int] = [:]
    for (index, name) in cityNames.enumerated() {
        cityDict[name] = index
    }
    _ = Int(readLine()!)!
    let toVisit = readLine()!.split(separator: " ").compactMap { cityDict[String($0)] }
    let k = Int(readLine()!)!
    var normalMinPrice: [[Int]] = .init(
        repeating: [Int](repeating: maxCost, count: n),
        count: n
    )
    var neailroMinPrice: [[Int]] = .init(
        repeating: [Int](repeating: maxCost, count: n),
        count: n
    )
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{ String($0) }
        let (transportation, start, end, price) = (Transportation(rawValue: input[0])!, cityDict[input[1]]!, cityDict[input[2]]!, Int(input[3])! * 2)
        let neailroPrice = price / transportation.neailroFactor
        
        normalMinPrice[start][end] = min(price, normalMinPrice[start][end])
        normalMinPrice[end][start] = min(price, normalMinPrice[end][start])
        neailroMinPrice[start][end] = min(neailroPrice, neailroMinPrice[start][end])
        neailroMinPrice[end][start] = min(neailroPrice, neailroMinPrice[end][start])
    }
    
    for i in 0..<n {
        normalMinPrice[i][i] = 0
        neailroMinPrice[i][i] = 0
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                var newPrice = normalMinPrice[i][k] + normalMinPrice[k][j]
                normalMinPrice[i][j] = min(newPrice, normalMinPrice[i][j])
                
                newPrice = neailroMinPrice[i][k] + neailroMinPrice[k][j]
                neailroMinPrice[i][j] = min(newPrice, neailroMinPrice[i][j])
            }
        }
    }
    
    var normalSum = 0
    var neailroSum = 0
    
    for i in stride(from: 0, to: toVisit.count - 1, by: 1) {
        normalSum += normalMinPrice[toVisit[i]][toVisit[i+1]]
        neailroSum += neailroMinPrice[toVisit[i]][toVisit[i+1]]
    }
    
    print(normalSum <= neailroSum + r ? "No" : "Yes")
}
solution()