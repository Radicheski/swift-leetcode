//
//  ConvertBinaryNumberInALinkedListToInteger.swift
//  https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
//
//  Created by Erik Radicheski da Silva on 29/12/22.
//

import XCTest

final class ConvertBinaryNumberInALinkedListToInteger: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 0, 1])
        XCTAssertEqual(solution.getDecimalValue(input), 5)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([0])
        XCTAssertEqual(solution.getDecimalValue(input), 0)
    }

}

private class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var result = 0
        
        var node: ListNode! = head
        
        repeat {
            result *= 2
            
            result += node.val
            
            node = node.next
        } while node != nil
        
        return result
    }
}
