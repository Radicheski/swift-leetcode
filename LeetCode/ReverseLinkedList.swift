//
//  ReverseLinkedList.swift
//  https://leetcode.com/problems/reverse-linked-list/
//
//  Created by Erik Radicheski da Silva on 18/08/22.
//

import XCTest

class ReverseLinkedList: XCTestCase {

    func test() {
        let solution = Solution()

        var input, output: ListNode?

        input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        output = ListNode.createLinkedList([5, 4, 3, 2, 1])
        XCTAssertEqual(solution.reverseList(input), output)

        input = ListNode.createLinkedList([1, 2])
        output = ListNode.createLinkedList([2, 1])
        XCTAssertEqual(solution.reverseList(input), output)

        input = ListNode.createLinkedList([])
        output = ListNode.createLinkedList([])
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
