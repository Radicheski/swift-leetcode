//
//  MergeInBetweenLinkedLists.swift
//  https://leetcode.com/problems/merge-in-between-linked-lists/?envType=daily-question&envId=2024-03-20
//
//  Created by Erik Radicheski da Silva on 20/03/24.
//

import XCTest

final class MergeInBetweenLinkedLists: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let list1 = ListNode.createLinkedList([10, 1, 13, 6, 9, 5])
        let list2 = ListNode.createLinkedList([1000000, 1000001, 1000002])
        let expectedOutput = ListNode.createLinkedList([10, 1, 13, 1000000, 1000001, 1000002, 5])
        XCTAssertEqual(solution.mergeInBetween(list1, 3, 4, list2), expectedOutput)
    }
    
    func testExampleB() {
        let list1 = ListNode.createLinkedList([0, 1, 2, 3, 4, 5, 6])
        let list2 = ListNode.createLinkedList([1000000, 1000001, 1000002, 1000003, 1000004])
        let expectedOutput = ListNode.createLinkedList([0, 1, 1000000, 1000001, 1000002, 1000003, 1000004, 6])
        XCTAssertEqual(solution.mergeInBetween(list1, 2, 5, list2), expectedOutput)
    }
}

private class Solution {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var i = 0
        var node = list1
        
        var tailList2 = list2
        
        while tailList2?.next != nil {
            tailList2 = tailList2?.next
        }
        
        var nodeA: ListNode?
        
        while i < b + 1 {
            if i == a - 1 {
                nodeA = node
            }
            
            node = node?.next
            
            i += 1
        }
        
        nodeA?.next = list2
        tailList2?.next = node
        
        return list1
    }
}
