let n = Int(readLine()!)!
var stars: String = ""

for i in 0..<n {
    stars += (String(repeating: "*", count: i+1) + "\n")
}
print(stars)