let input = readLine()!
var subset: Set<String> = []
var start = input.startIndex
var end = input.startIndex

while start != input.endIndex, end != input.endIndex {
    subset.insert(String(input[start...end]))
    end = input.index(after: end)
    if end == input.endIndex {
        start = input.index(after: start)
        end = start
    }
}

print(subset.count)