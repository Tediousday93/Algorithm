let LC = readLine()!.split(separator: " ").compactMap { Int($0) }
let l = LC[0]
let c = LC[1]
let list = readLine()!.split(separator: " ").sorted(by: <)
let vowels: [Character] = ["a", "e", "i", "o", "u"]
var result = ""

func solution(k: Int, cur: String, start: Int) {
    if k == l {
        var vowelCount = 0
        var consonantCount = 0
        for char in cur {
            vowels.contains(char) ? (vowelCount += 1) : (consonantCount += 1)
        }
        if vowelCount >= 1 && consonantCount >= 2 { result += cur + "\n" }
        return
    }
    
    for i in start..<c {
        solution(k: k+1, cur: cur+list[i], start: i+1)
    }
}

solution(k: 0, cur: "", start: 0)
print(result)