let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var words: [String: Int] = [:]

for _ in 0..<n {
    let word = readLine()!
    if word.count < m { continue }
    words[word, default: 0] += 1
}

var toMemorize: [(word: String, count: Int)] = []
for (word, count) in words {
    toMemorize.append((word, count))
}

toMemorize.sort(by: {
    if $0.count != $1.count {
        return $0.count > $1.count
    } else {
        if $0.word.count != $1.word.count {
            return $0.word.count > $1.word.count
        } else {
            return $0.word < $1.word
        }
    }
})

var ans = ""
for (word, _) in toMemorize {
    ans += word + "\n"
}
print(ans)
