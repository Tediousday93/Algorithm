var sides = readLine()!.split(separator: " ").compactMap { Int($0) }
while !isTriangle(sides: sides) {
    let longest = sides.enumerated().max(by: { $0.element < $1.element })!
    sides[longest.offset] -= 1
}
print(sides.reduce(0, +))

func isTriangle(sides: [Int]) -> Bool {
    let max = sides.max()!
    return sides.reduce(0, +) - max > max
}