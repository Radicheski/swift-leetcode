//
//  SwapNodesInPairs.swift
//  https://leetcode.com/problems/swap-nodes-in-pairs/
//
//  Created by Erik Radicheski da Silva on 09/10/22.
//

import XCTest

final class SwapNodesInPairs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 4])
        let output = solution.swapPairs(input)
        let expectedOutput = ListNode.createLinkedList([2, 1, 4, 3])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([])
        let output = solution.swapPairs(input)
        let expectedOutput = ListNode.createLinkedList([])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleC() {
        let input = ListNode.createLinkedList([1])
        let output = solution.swapPairs(input)
        let expectedOutput = ListNode.createLinkedList([1])
        XCTAssertEqual(expectedOutput, output)
    }

}

private class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        let temp = head
        let head = head?.next
        let next = swapPairs(head?.next)
        head?.next = temp
        temp?.next = next
        
        return head
    }
}
