//
//  LinkedListCycle.swift
//  https://leetcode.com/problems/linked-list-cycle/
//
//  Created by Erik Radicheski da Silva on 06/09/22.
//

import XCTest

class LinkedListCycle: XCTestCase {

    func test() {
        let solution = Solution()
        
        var input: ListNode?
        
        input = ListNode.createTestCase([3, 2, 0, -4], 1).head
        XCTAssertTrue(solution.hasCycle(input))
        
        input = ListNode.createTestCase([1, 2], 0).head
        XCTAssertTrue(solution.hasCycle(input))
        
        input = ListNode.createTestCase([1], -1).head
        XCTAssertFalse(solution.hasCycle(input))
    }

}

private class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        
        var node = head
        var nodeArray = [ListNode?]()
        
        while node != nil {
            if nodeArray.contains(where: { $0 === node } ) { return true }
            nodeArray.append(node)
            node = node?.next
        }
        
        return false
    }
}
