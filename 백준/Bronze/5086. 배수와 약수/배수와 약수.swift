while let input = readLine(), input != "0 0" {
    let AB = input.split(separator: " ").compactMap { Int($0) }
    let a = AB[0], b = AB[1]
    let isDividedByA = (b % a == 0)
    let isDividedByB = (a % b == 0)
    if isDividedByA {
        print("factor")
    } else if isDividedByB {
        print("multiple")
    } else {
        print("neither")
    }
}