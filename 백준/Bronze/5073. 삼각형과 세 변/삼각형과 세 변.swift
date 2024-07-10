while let input = readLine(), input != "0 0 0" {
    let sides = input.split(separator: " ").compactMap { Int($0) }
    let maximum = sides.max()!
    let sum = sides.reduce(0, +)
    var ans = ""
    if sum - maximum <= maximum {
        ans = "Invalid"
    } else {
        if isEquilateral(sides: sides) {
            ans = "Equilateral"
        } else if isIsosceles(sides: sides) {
            ans = "Isosceles"
        } else {
            ans = "Scalene"
        }
    }
    print(ans)
}

func isEquilateral(sides: [Int]) -> Bool {
    let sum = sides.reduce(0, +)
    return sum / sides.first! == 3
}

func isIsosceles(sides: [Int]) -> Bool {
    var result: Bool = false
    for side in sides {
        result = sides.filter({ $0 == side }).count == 2
        if result == true { break }
    }
    return result
}