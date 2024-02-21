let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
var m = nm[1]
var cards: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
cards.sort(by: <)

while m > 0 {
    m -= 1
    let combinedCard = cards[0] + cards[1]
    cards[0] = combinedCard
    cards[1] = combinedCard
    cards.sort(by: <)
}

print(cards.reduce(0, +))