//
//  RemoveDuplicatesFromSortedList.swift
//  https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//
//  Created by Erik Radicheski da Silva on 07/09/22.
//

import XCTest

class RemoveDuplicatesFromSortedList: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let head = ListNode.createLinkedList([1, 1, 2])
        let output = solution.deleteDuplicates(head)
        let expectedOutput = ListNode.createLinkedList([1, 2])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([1, 1, 2, 3, 3])
        let output = solution.deleteDuplicates(head)
        let expectedOutput = ListNode.createLinkedList([1, 2, 3])
        XCTAssertTrue(ListNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head
        
        while let nextNode = node?.next {
            if node?.val == nextNode.val {
                node?.next = nextNode.next
                continue
            }
            node = nextNode
        }
        
        return head
    }
}
