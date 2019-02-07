/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.


//TODO: Queue Protocol
protocol Queue {
    associatedtype Element

    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?

}

struct QueueArray<T>: Queue {
    //TODO: Queue Array
    private var storage: [T] = .init()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var peek: T? {
        return storage.first
    }

    mutating func enqueue(_ element: T) {
        storage.append(element)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        return storage.isEmpty ? nil : storage.remove(at: 0)
    }
}



struct QueueStack<T>: Queue {
    //TODO: Queue Stack
    private var enqueueStack: [T] = .init()
    private var dequeueStack: [T] = .init()

    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }

    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }

    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    

}