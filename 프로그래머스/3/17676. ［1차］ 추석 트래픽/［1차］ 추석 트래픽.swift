struct ServerLog {
    let completeTime: Int
    let operationTime: Int
    let startTime: Int
    
    init(completeTime: Int, operationTime: Int) {
        self.completeTime = completeTime
        self.operationTime = operationTime
        self.startTime = completeTime - operationTime + 1
    }
}

func secondStringToMiliSec(_ line: String) -> Int {
    let splited = line.split(separator: ".").map { String($0) }
    var milisec = Int(splited[0])! * 1000
    if splited.count != 1 {
        let floatNum = splited[1]
        switch floatNum.count {
        case 1:
            milisec += Int(floatNum + "00")!
        case 2:
            milisec += Int(floatNum + "0")!
        case 3:
            milisec += Int(floatNum)!
        default:
            break
        }
    }
    return milisec
}

func solution(_ lines:[String]) -> Int {
    func stringToServerLog(_ line: String) -> ServerLog {
        var splitLog = line.split(separator: " ").map { String($0) }
        
        let completeTimeComponents = splitLog[1].split(separator: ":")
        let miliSecond = secondStringToMiliSec(String(completeTimeComponents[2]))
        let completeTime = ((3600 * Int(completeTimeComponents[0])!) + (60 * Int(completeTimeComponents[1])!)) * 1000 + miliSecond
        
        splitLog[2].removeLast()
        let operationTime = secondStringToMiliSec(String(splitLog[2]))
        
        return ServerLog(completeTime: completeTime, operationTime: operationTime)
    }
    
    let logList = lines.map { stringToServerLog($0) }
        .sorted(by: { $0.completeTime < $1.completeTime })
    
    var maximum = 0
    for index in 0..<logList.count {
        let log = logList[index]
        let operationRangeEdge = log.completeTime + 999
        var operationCount = 1
        
        for nextLogIndex in stride(from: index+1, to: logList.count, by: 1) {
            let nextLog = logList[nextLogIndex]
            let (nextStart, nextComplete) = (nextLog.startTime, nextLog.completeTime)
            if (nextStart <= log.completeTime && nextComplete >= log.completeTime) ||
               (nextStart <= operationRangeEdge && nextComplete >= operationRangeEdge) ||
               (nextStart <= log.completeTime && nextComplete >= operationRangeEdge) ||
               (nextStart >= log.completeTime && nextComplete <= operationRangeEdge) {
                operationCount += 1
            }
        }
        maximum = max(maximum, operationCount)
    }
    
    return maximum
}