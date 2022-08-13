//
//  Palindrome Linked List.swift
//  https://leetcode.com/problems/palindrome-linked-list/
//
//  Created by Erik Radicheski da Silva on 09/08/22.
//

import XCTest

class PalindromeLinkedList: XCTestCase {

    func test() {
        let solution = Solution()
        var head: ListNode?

        head = ListNode.createLinkedList([1, 2, 2, 1])
        XCTAssertTrue(solution.isPalindrome(head))

        head = ListNode.createLinkedList([1, 2])
        XCTAssertFalse(solution.isPalindrome(head))

    }

}

private class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {

        var node = head

        var list = [Int]()

        while node != nil {
            guard let val = node?.val else { break }
            list.append(val)
            node = node?.next
        }

        let count = list.count

        for index in 0 ..< count / 2 {
            if list[index] != list[count - index - 1] {
                return false
            }
        }

        return true

    }
}
