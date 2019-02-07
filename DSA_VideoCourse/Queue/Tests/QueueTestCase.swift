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


import XCTest
@testable import DataStructures

final class QueueTestCase: XCTestCase {
    var queueArray = QueueArray<Int>()
    var queueStack = QueueStack<Int>()

    override func setUp() {
        queueArray.enqueue(1)
        queueArray.enqueue(2)
        queueArray.enqueue(3)

        queueStack.enqueue(1)
        queueStack.enqueue(2)
        queueStack.enqueue(3)
    }

    func test_enqueueArray() {
        XCTAssert(queueArray.peek == 1)
    }

    func test_enqueueStack() {
        XCTAssert(queueStack.peek == 1)
    }

    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        XCTAssert(queueArray.dequeue() == 3)
        queueArray.dequeue()
        XCTAssert(queueArray.isEmpty == true)
    }

    func test_dequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        XCTAssert(queueStack.dequeue() == 3)
        queueStack.dequeue()
        XCTAssert(queueStack.isEmpty == true)
    }

}
