//
//  ImplementQueueUsingStacks.swift
//  https://leetcode.com/problems/implement-queue-using-stacks/
//
//  Created by Erik Radicheski da Silva on 08/09/22.
//

import XCTest

class ImplementQueueUsingStacks: XCTestCase {

    func test() {
        
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

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
