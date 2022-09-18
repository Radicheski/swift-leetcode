//
//  RemoveNthNodeFromEndOfList.swift
//  https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//
//  Created by Erik Radicheski da Silva on 18/09/22.
//

import XCTest

final class RemoveNthNodeFromEndOfList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = solution.removeNthFromEnd(input, 2)
        let expectedOutput = ListNode.createLinkedList([1, 2, 3, 5])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([1])
        let output = solution.removeNthFromEnd(input, 1)
        let expectedOutput = ListNode.createLinkedList([])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }
    
    func testExampleC() {
        let input = ListNode.createLinkedList([1, 2])
        let output = solution.removeNthFromEnd(input, 1)
        let expectedOutput = ListNode.createLinkedList([1])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var currentNode = head
        
        var nodeToRemove = head
        var precedingNode: ListNode?
        
        var index = 0
        
        while currentNode != nil {
            index += 1
            
            if index > n {
                precedingNode = nodeToRemove
                nodeToRemove = nodeToRemove?.next
            }
            
            currentNode = currentNode?.next
        }
        
        precedingNode?.next = nodeToRemove?.next
        
        return index == n ? head?.next : head
    }
    
}
