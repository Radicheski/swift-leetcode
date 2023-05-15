//
//  SwappingNodesInALinkedList.swift
//  https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
//
//  Created by Erik Radicheski da Silva on 15/05/23.
//

import XCTest

final class SwappingNodesInALinkedList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = ListNode.createLinkedList([1, 4, 3, 2, 5])
        XCTAssertEqual(solution.swapNodes(input, 2), output)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([7, 9, 6, 6, 7, 8, 3, 0, 9, 5])
        let output = ListNode.createLinkedList([7, 9, 6, 6, 8, 7, 3, 0, 9, 5])
        XCTAssertEqual(solution.swapNodes(input, 5), output)
    }

}

private class Solution {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let _ = head else { return nil }
        
        var nodeA: ListNode?, nodeB: ListNode?
        
        var pointer = head
        var counter = 0
        
        while pointer != nil {
            counter += 1
            
            nodeB = nodeB?.next
            
            if counter == k {
                nodeA = pointer
                nodeB = head
            }
            
            pointer = pointer?.next
        }
        
        let temp = nodeA!.val
        nodeA?.val = nodeB!.val
        nodeB?.val = temp
        
        return head
    }
}
