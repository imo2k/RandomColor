import Foundation

// 배열
var nums = [1,2,3,4,5,6]

nums.append(7)
print(nums)

// Queue (FIFO)
// 시간 복잡도 및 dequeue 추가 예외 처리 사항 정리 필요함
struct Queue<T> {
    private var elements = [T]()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

var myQueue = Queue<Int>()

myQueue.enqueue(10)
myQueue.dequeue()

struct Stack<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
}
