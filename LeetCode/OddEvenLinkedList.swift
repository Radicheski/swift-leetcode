//
//  OddEvenLinkedList.swift
//  https://leetcode.com/problems/odd-even-linked-list/
//
//  Created by Erik Radicheski da Silva on 12/11/22.
//

import XCTest

final class OddEvenLinkedList: XCTestCase {

    private let solution = Solution()
    
    func testExampleA(){
        let input = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let expectedOutput = ListNode.createLinkedList([1, 3, 5, 2, 4])
        let output = solution.oddEvenList(input)
        XCTAssertTrue(ListNode.isEqual(expectedOutput, output))
    }
    
    func testExampleB(){
        let input = ListNode.createLinkedList([2, 1, 3, 5, 6, 4, 7])
        let expectedOutput = ListNode.createLinkedList([2, 3, 6, 7, 1, 5, 4])
        let output = solution.oddEvenList(input)
        XCTAssertTrue(ListNode.isEqual(expectedOutput, output))
    }

}

private class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let firstOdd = head
        var lastOdd = firstOdd
        let firstEven = head?.next
        var lastEven = firstEven
        
        while let next = lastEven?.next {
            lastOdd?.next = next
            lastOdd = next
            
            lastEven?.next = next.next
            lastEven = next.next
        }
        
        lastOdd?.next = firstEven
        
        return firstOdd
    }
}
