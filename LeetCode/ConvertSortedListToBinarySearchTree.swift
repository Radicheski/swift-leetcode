//
//  ConvertSortedListToBinarySearchTree.swift
//  https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 11/03/23.
//

import XCTest

final class ConvertSortedListToBinarySearchTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = ListNode.createLinkedList([-10, -3, 0, 5, 9])
        let output = TreeNode.parseTree(from: [0, -3, 9, -10, nil, 5])
        XCTAssertTrue(TreeNode.isEqual(solution.sortedListToBST(input), output))
    }
    
    func testExampleB() {
        let input = ListNode.createLinkedList([])
        let output = TreeNode.parseTree(from: [])
        XCTAssertTrue(TreeNode.isEqual(solution.sortedListToBST(input), output))
    }

}

private class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }
        guard head?.next != nil else { return TreeNode(head!.val) }
        
        var slowPointer = head
        var fastPointer = head?.next?.next
        
        while fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        let temp = slowPointer?.next
        slowPointer?.next = nil
        
        let root = TreeNode(temp!.val)
        
        root.left = sortedListToBST(head)
        root.right = sortedListToBST(temp?.next)
        
        return root
    }
}
