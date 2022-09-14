//
//  ReverseLinkedList.swift
//  https://leetcode.com/problems/reverse-linked-list/
//
//  Created by Erik Radicheski da Silva on 18/08/22.
//

import XCTest

class ReverseLinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = ListNode.createLinkedList([5, 4, 3, 2, 1])
        XCTAssertEqual(solution.reverseList(input), output)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([1, 2])
        let output = ListNode.createLinkedList([2, 1])
        XCTAssertEqual(solution.reverseList(input), output)
    }
    
    func tesExampleC() {
        let input = ListNode.createLinkedList([])
        let output = ListNode.createLinkedList([])
        XCTAssertEqual(solution.reverseList(input), output)
    }

}

private class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var result: ListNode?

        while head != nil {
            result = ListNode(head!.val, result)
            head = head?.next
        }

        return result
    }
}
