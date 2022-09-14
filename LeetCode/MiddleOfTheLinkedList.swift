//
//  MiddleOfTheLinkedList.swift
//  https://leetcode.com/problems/middle-of-the-linked-list/
//
//  Created by Erik Radicheski da Silva on 12/08/22.
//

import XCTest

class MiddleOfTheLinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let target = ListNode.createLinkedList([3, 4, 5])
        XCTAssertEqual(target, solution.middleNode(head))
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([1, 2, 3, 4, 5, 6])
        let target = ListNode.createLinkedList([4, 5, 6])
        XCTAssertEqual(target, solution.middleNode(head))
    }

}

private class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var middle = head
        var next = head?.next
        var counter = 0

        while next != nil {
            counter += 1
            if counter % 2 == 1 {
                middle = middle?.next
            }
            next = next?.next
        }

        return middle
    }
}
