let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = input[0], b = input[1]
var ans = ""
if a == b {
    ans = "=="
} else if a > b {
    ans = ">"
} else {
    ans = "<"
}
print(ans)