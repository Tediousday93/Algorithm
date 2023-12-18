let p = Int(readLine()!)!

if 90...100 ~= p {
    print("A")
} else if 80...89 ~= p {
    print("B")
} else if 70...79 ~= p {
    print("C")
} else if 60...69 ~= p {
    print("D")
} else {
    print("F")
}