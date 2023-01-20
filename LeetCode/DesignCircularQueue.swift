//
//  DesignCircularQueue.swift
//  https://leetcode.com/problems/design-circular-queue/
//
//  Created by Erik Radicheski da Silva on 20/01/23.
//

import XCTest

final class DesignCircularQueue: XCTestCase {

    // TODO: Test cases

}

private class MyCircularQueue {
    
    private var queue = [Int]()
    private var size: Int
    
    init(_ k: Int) {
        size = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard isFull() == false else { return false }
        
        queue.append(value)
        
        return true
    }
    
    func deQueue() -> Bool {
        guard isEmpty() == false else { return false }
        
        let _ = queue.removeFirst()
        
        return true
    }
    
    func Front() -> Int {
        queue.first ?? -1
    }
    
    func Rear() -> Int {
        queue.last ?? -1
    }
    
    func isEmpty() -> Bool {
        queue.isEmpty
    }
    
    func isFull() -> Bool {
        queue.count >= size
    }
}
