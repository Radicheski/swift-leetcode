//
//  LinkedListCycle2.swift
//  https://leetcode.com/problems/linked-list-cycle-ii/
//
//  Created by Erik Radicheski da Silva on 19/08/22.
//

import XCTest

class LinkedListCycle2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createTestCase([3, 2, 0, -4], 1)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
    }
    
    func testExampleB() {
        let input = ListNode.createTestCase([1, 2], 0)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
    }
    
    func testExampleC() {
        let input = ListNode.createTestCase([1], -1)
        XCTAssert(solution.detectCycle(input.head) === input.cycle)
    }

}

private class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        
        var node = head
        var nodeArray = [ListNode?]()
        
        while node != nil {
            if nodeArray.contains(where: { $0 === node } ) { return node }
            nodeArray.append(node)
            node = node?.next
        }
        
        return nil
    }
}
