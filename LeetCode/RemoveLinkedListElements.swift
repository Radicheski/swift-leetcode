//
//  RemoveLinkedListElements.swift
//  https://leetcode.com/problems/remove-linked-list-elements/
//
//  Created by Erik Radicheski da Silva on 06/09/22.
//

import XCTest

class RemoveLinkedListElements: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let head = ListNode.createLinkedList([1, 2, 6, 3, 4, 5, 6])
        let output = solution.removeElements(head, 6)
        let expectedOutput = ListNode.createLinkedList([1, 2, 3, 4, 5])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([])
        let output = solution.removeElements(head, 1)
        let expectedOutput = ListNode.createLinkedList([])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }
    
    func testExampleC() {
        let head = ListNode.createLinkedList([7, 7, 7, 7])
        let output = solution.removeElements(head, 7)
        let expectedOutput = ListNode.createLinkedList([])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        var currentNode = head
        var previousNode: ListNode?
        var newHead = head?.val == val ? nil : head;
        
        while currentNode != nil {
            if currentNode?.val == val {
                previousNode?.next = currentNode?.next
                currentNode = currentNode?.next
                continue
            }
            if newHead == nil && currentNode?.val != val {
                newHead = currentNode
            }
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        return newHead
    }
}
