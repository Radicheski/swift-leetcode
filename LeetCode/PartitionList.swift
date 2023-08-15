//
//  PartitionList.swift
//  https://leetcode.com/problems/partition-list/
//
//  Created by Erik Radicheski da Silva on 15/08/23.
//

import XCTest

final class PartitionList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 4, 3, 2, 5, 2])
        let expectedOutput = ListNode.createLinkedList([1, 2, 2, 4, 3, 5])
        XCTAssertEqual(solution.partition(input, 3), expectedOutput)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([2, 1])
        let expectedOutput = ListNode.createLinkedList([1, 2])
        XCTAssertEqual(solution.partition(input, 2), expectedOutput)
    }

}

private class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var leftHead: ListNode?
        var leftTail: ListNode?
        
        var rightHead: ListNode?
        var rightTail: ListNode?
        
        var currentNode = head
        
        while currentNode != nil {
            let node = ListNode(currentNode!.val)
            
            if node.val < x {
                if leftHead == nil {
                    leftHead = node
                }
                
                if leftTail != nil {
                    leftTail?.next = node
                }
                
                leftTail = node
            } else {
                if rightHead == nil {
                    rightHead = node
                }
                
                if rightTail != nil {
                    rightTail?.next = node
                }
                
                rightTail = node
            }
            
            currentNode = currentNode?.next
        }
        
        leftTail?.next = rightHead
        
        return leftHead == nil ? rightHead : leftHead
    }
}
