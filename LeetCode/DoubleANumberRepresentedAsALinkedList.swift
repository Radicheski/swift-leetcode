//
//  DoubleANumberRepresentedAsALinkedList.swift
//  https://leetcode.com/problems/double-a-number-represented-as-a-linked-list/
//
//  Created by Erik Radicheski da Silva on 08/05/24.
//

import XCTest

final class DoubleANumberRepresentedAsALinkedList: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([1, 8, 9])
        let expectedOutput = ListNode.createLinkedList([3, 7, 8])
        XCTAssertEqual(solution.doubleIt(head), expectedOutput)
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([9, 9, 9])
        let expectedOutput = ListNode.createLinkedList([1, 9, 9, 8])
        XCTAssertEqual(solution.doubleIt(head), expectedOutput)
    }
    
}

private class Solution {
    func doubleIt(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var stack = [head]
        
        while let node = stack.last?.next {
            stack.append(node)
        }
        
        var carry = 0
        
        while let node = stack.popLast() {
            node.val *= 2
            node.val += carry
            carry = node.val / 10
            node.val %= 10
        }
        
        if carry > 0 {
            return ListNode(carry, head)
        } else {
            return head
        }
    }
}
