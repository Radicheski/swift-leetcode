//
//  LinkedListRandomNode.swift
//  https://leetcode.com/problems/linked-list-random-node/
//
//  Created by Erik Radicheski da Silva on 10/03/23.
//

import XCTest

final class LinkedListRandomNode: XCTestCase {

    // TODO: Test cases
    
}

private class Solution {
    
    private var head: ListNode?
    
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var scope = 1.0
        var chosenValue = 0
        
        var current = self.head
        
        while current != nil {
            if Double.random(in: 0 ..< 1) < 1 / scope {
                chosenValue = current!.val
            }
            
            scope += 1
            current = current?.next
        }
        
        return chosenValue
    }
}
