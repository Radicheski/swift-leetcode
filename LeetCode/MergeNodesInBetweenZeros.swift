//
//  MergeNodesInBetweenZeros.swift
//  https://leetcode.com/problems/merge-nodes-in-between-zeros/description/?envType=daily-question&envId=2024-07-04
//
//  Created by Erik Radicheski da Silva on 04/07/24.
//

import XCTest

final class MergeNodesInBetweenZeros: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = ListNode.createLinkedList([0, 3, 1, 0, 4, 5, 2, 0])
        let output = ListNode.createLinkedList([4, 11])
        XCTAssertEqual(solution.mergeNodes(root), output)
    }
    
    func testExampleB() {
        let root = ListNode.createLinkedList([0, 1, 0, 3, 0, 2, 2, 0])
        let output = ListNode.createLinkedList([1, 3, 4])
        XCTAssertEqual(solution.mergeNodes(root), output)
    }
    
}

private class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var values = [Int]()
        
        var sum = 0
        var node = head
        
        while node != nil {
            if node?.val == 0 && sum > 0{
                values.append(sum)
                sum = 0
            } else {
                sum += node!.val
            }
            
            node = node?.next
        }
        
        var newHead: ListNode?
        var last: ListNode?
        
        for val in values {
            let newNode = ListNode(val)
            if newHead == nil { newHead = newNode }
            last?.next = newNode
            last = newNode
        }
        
        
        return newHead
    }
}
