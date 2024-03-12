//
//  RemoveZeroSumConsecutiveNodesFromLinkedList.swift
//  https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
//
//  Created by Erik Radicheski da Silva on 12/03/24.
//

import XCTest

final class RemoveZeroSumConsecutiveNodesFromLinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = ListNode.createLinkedList([1, 2, -3, 3, 1])
        let answer = ListNode.createLinkedList([3, 1])
        XCTAssertEqual(solution.removeZeroSumSublists(root), answer)
    }
    
    func testExampleB() {
        let root = ListNode.createLinkedList([1, 2, 3, -3, 4])
        let answer = ListNode.createLinkedList([1, 2, 4])
        XCTAssertEqual(solution.removeZeroSumSublists(root), answer)
    }
    
    func testExampleC() {
        let root = ListNode.createLinkedList([1, 2, 3, -3, -2])
        let answer = ListNode.createLinkedList([1])
        XCTAssertEqual(solution.removeZeroSumSublists(root), answer)
    }
    
}

private class Solution {
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        var front: ListNode? = ListNode(0, head)
        var start = front
        
        while let _ = start {
            var prefixSum = 0
            var end = start?.next
            
            while let _ = end {
                prefixSum += end!.val
                
                if prefixSum == 0 {
                    start?.next = end?.next
                }
                
                end = end?.next
            }
            
            start = start?.next
        }
        
        return front?.next
    }
}
