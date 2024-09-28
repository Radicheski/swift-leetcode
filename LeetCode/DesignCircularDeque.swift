//
//  DesignCircularDeque.swift
//  https://leetcode.com/problems/design-circular-deque/
//
//  Created by Erik Radicheski da Silva on 28/09/24.
//

import XCTest

final class DesignCircularDeque: XCTestCase {
}

private class MyCircularDeque {
    
    private let size: Int
    private var queue = [Int]()
    
    init(_ k: Int) {
        size = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        guard queue.count < size else { return false }
        queue.insert(value, at: 0)
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        guard queue.count < size else { return false }
        queue.append(value)
        return true
    }
    
    func deleteFront() -> Bool {
        guard queue.isEmpty == false else { return false }
        queue.removeFirst()
        return true
    }
    
    func deleteLast() -> Bool {
        guard queue.isEmpty == false else { return false }
        queue.removeLast()
        return true
    }
    
    func getFront() -> Int {
        return queue.first ?? -1
    }
    
    func getRear() -> Int {
        return queue.last ?? -1
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func isFull() -> Bool {
        return queue.count == size
    }
}
