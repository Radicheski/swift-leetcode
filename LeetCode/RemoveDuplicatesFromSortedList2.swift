//
//  RemoveDuplicatesFromSortedList2.swift
//  https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
//
//  Created by Erik Radicheski da Silva on 08/10/22.
//

import XCTest

final class RemoveDuplicatesFromSortedList2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([1, 2, 3, 3, 4, 4, 5])
        let output = solution.deleteDuplicates(input)
        let expectedOutput = ListNode.createLinkedList([1, 2, 5])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([1, 1, 1, 2, 3])
        let output = solution.deleteDuplicates(input)
        let expectedOutput = ListNode.createLinkedList([2, 3])
        XCTAssertEqual(expectedOutput, output)
    }
    
}

private class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var set = Set<Int>()
        var reapeated = Set<Int>()
        
        var next = head
        
        while next != nil {
            if let val = next?.val {
                if set.remove(val) == nil && !reapeated.contains(val) {
                    set.insert(val)
                } else {
                    reapeated.insert(val)
                }
            }
            next = next?.next
        }
        
        return set.sorted(by: >).reduce(into: nil) { head, val in
            let node = ListNode(val, head)
            head = node
        }
    }
}
