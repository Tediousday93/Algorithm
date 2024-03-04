let abv = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = abv[0]
let b = abv[1]
let v = abv[2]
let day: Int
if (v - b) % (a - b) == 0 {
    day = (v - b) / (a - b)
} else {
    day = (v - b) / (a - b) + 1
}
print(day)