//
//  ImplementStackUsingQueues.swift
//  https://leetcode.com/problems/implement-stack-using-queues/
//
//  Created by Erik Radicheski da Silva on 28/08/23.
//

import XCTest

final class ImplementStackUsingQueues: XCTestCase {

    // TODO: Test cases

}

private class MyStack {
    
    private var topElement = Int.min
    private var queue = [Int]()
    
    func push(_ x: Int) {
        queue.append(x)
        topElement = x
    }
    
    func pop() -> Int {
        let previousTop = topElement
        
        var tempQueue = [Int]()
        
        while queue.count > 1 {
            topElement = queue.removeFirst()
            tempQueue.append(topElement)
        }
        
        queue = tempQueue
        
        return previousTop
    }
    
    func top() -> Int {
        return topElement
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}
