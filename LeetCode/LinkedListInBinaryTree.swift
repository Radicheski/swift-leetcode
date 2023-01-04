//
//  LinkedListInBinaryTree.swift
//  https://leetcode.com/problems/linked-list-in-binary-tree/
//
//  Created by Erik Radicheski da Silva on 04/01/23.
//

import XCTest

final class LinkedListInBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let head = ListNode.createLinkedList([4, 2, 8])
        let root = TreeNode.parseTree(from: [1, 4, 4, nil, 2, 2, nil, 1, nil, 6, 8, nil, nil, nil, nil, 1, 3])
        XCTAssertTrue(solution.isSubPath(head, root))
    }
    
    func testExampleB() {
        let head = ListNode.createLinkedList([1, 4, 2, 6])
        let root = TreeNode.parseTree(from: [1, 4, 4, nil, 2, 2, nil, 1, nil, 6, 8, nil, nil, nil, nil, 1, 3])
        XCTAssertTrue(solution.isSubPath(head, root))
    }
    
    func testExampleC() {
        let head = ListNode.createLinkedList([1, 4, 2, 6, 8])
        let root = TreeNode.parseTree(from: [1, 4, 4, nil, 2, 2, nil, 1, nil, 6, 8, nil, nil, nil, nil, 1, 3])
        XCTAssertFalse(solution.isSubPath(head, root))
    }

}

private class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        return findSubpath(head, root) || isSubPath(head, root.left) || isSubPath(head, root.right)
    }
    
    private func findSubpath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        
        return head.val == root.val && (findSubpath(head.next, root.left) || findSubpath(head.next, root.right))
    }
}
