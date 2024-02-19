let testCount = Int(readLine()!)!

func maximumBenefit(from stockPrices: [Int]) -> Int {
    var curPrice: Int = 0
    var maximumBenefit: Int = 0

    stockPrices.forEach { stockPrice in
                         if curPrice > stockPrice {
                             maximumBenefit += curPrice - stockPrice
                         } else if curPrice < stockPrice {
                             curPrice = stockPrice
                         }
                        }

    return maximumBenefit
}

for _ in 0..<testCount {
    let n = Int(readLine()!)!
    let stockPrices: [Int] = readLine()!.split(separator: " ")
    .compactMap { Int($0) }
    .reversed()

    print(maximumBenefit(from: stockPrices))
}