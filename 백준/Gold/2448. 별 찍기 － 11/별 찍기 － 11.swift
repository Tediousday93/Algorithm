let n = Int(readLine()!)!
var cur: [String] = ["  *  ", " * * ", "*****"]
var prev: [String] = []
var space: String = "   "

func drawStar(h: Int) {
    if h == n {
        for i in 0..<h/2 {
            print(space + cur[i] + space)
        }
        for i in 0..<h/2 {
            print(cur[i] + " " + cur[i])
        }
        return
    }
    
    prev = cur
    cur = []
    for i in 0..<h/2 {
        cur.append(space + prev[i] + space)
    }
    for i in 0..<h/2 {
        cur.append(prev[i] + " " + prev[i])
    }
    space += space
    drawStar(h: 2*h)
}

switch n {
  case 3: print("  *  \n * * \n*****")
  default: drawStar(h: 6)
}