//
//  DeleteNodesFromLinkedListPresentInArray.swift
//  https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array/
//
//  Created by Erik Radicheski da Silva on 06/09/24.
//

import XCTest

final class DeleteNodesFromLinkedListPresentInArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = ListNode.createLinkedList([1, 2, 3, 4, 5])
        let output = ListNode.createLinkedList([4, 5])
        XCTAssertEqual(solution.modifiedList([1, 2, 3], root), output)
    }
    
    func testExampleB() {
        let root = ListNode.createLinkedList([1, 2, 1, 2, 1, 2])
        let output = ListNode.createLinkedList([2, 2, 2])
        XCTAssertEqual(solution.modifiedList([1], root), output)
    }
    
    func testExampleC() {
        let root = ListNode.createLinkedList([1, 2, 3, 4])
        let output = ListNode.createLinkedList([1, 2, 3, 4])
        XCTAssertEqual(solution.modifiedList([5], root), output)
    }
    
}

private class Solution {
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        let nums = Set(nums)
        var list = [head]
        
        while let next = list.last?.next {
            list.append(next)
        }
        
        list = list.filter { nums.contains($0.val) == false }
        
        for i in list.indices where i > 0 {
            list[i - 1].next = list[i]
        }
        
        list.last?.next = nil
        
        return list.first
    }
}
