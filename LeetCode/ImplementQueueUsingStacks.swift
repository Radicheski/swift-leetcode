//
//  ImplementQueueUsingStacks.swift
//  https://leetcode.com/problems/implement-queue-using-stacks/
//
//  Created by Erik Radicheski da Silva on 08/09/22.
//

import XCTest

class ImplementQueueUsingStacks: XCTestCase {

    func testExampleA() {
        let operations = ["MyQueue", "push", "push", "peek", "pop", "empty"]
        let arguments = [[], [1], [2], [], [], []]
        let output: [Any?] = [nil, nil, nil, 1, 1, false]
        
        var queue: MyQueue?
        
        for index in 0 ..< operations.count {
            switch operations[index] {
            case "MyQueue": queue = MyQueue()
            case "push": queue?.push(arguments[index].first!)
            case "peek": XCTAssertEqual(queue?.peek(), output[index] as? Int)
            case "pop": XCTAssertEqual(queue?.pop(), output[index] as? Int)
            case "empty": XCTAssertEqual(queue?.empty(), output[index] as? Bool)
            default: XCTFail()
            }
        }
        
    }

}

private class MyQueue {
    
    var queue: [Int]

    init() {
        queue = []
    }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    func peek() -> Int {
        return queue[0]
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}
