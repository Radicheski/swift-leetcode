//
//  MergeTwoSortedLists.swift
//  https://leetcode.com/problems/merge-two-sorted-lists/
//
//  Created by Erik Radicheski da Silva on 18/08/22.
//

import XCTest

class MergeTwoSortedLists: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let list1 = ListNode.createLinkedList([1, 2, 4])
        let list2 = ListNode.createLinkedList([1, 3, 4])
        let result = ListNode.createLinkedList([1, 1, 2, 3, 4, 4])
        XCTAssertEqual(solution.mergeTwoLists(list1, list2), result)
    }
    
    func testExampleB() {
        let list1 = ListNode.createLinkedList([])
        let list2 = ListNode.createLinkedList([])
        let result = ListNode.createLinkedList([])
        XCTAssertEqual(solution.mergeTwoLists(list1, list2), result)
    }
    
    func testExampleC() {
        let list1 = ListNode.createLinkedList([])
        let list2 = ListNode.createLinkedList([0])
        let result = ListNode.createLinkedList([0])
        XCTAssertEqual(solution.mergeTwoLists(list1, list2), result)
    }

}

private class Solution {

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }

        if list2 == nil {
            return list1
        }

        if let val1 = list1?.val,
           let val2 = list2?.val {
            if val1 < val2 {
                list1?.next = mergeTwoLists(list1?.next, list2)
                return list1
            } else {
                list2?.next = mergeTwoLists(list1, list2?.next)
                return list2
            }
        } else {
            return nil
        }
    }

}
