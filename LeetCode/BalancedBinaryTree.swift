//
//  BalancedBinaryTree.swift
//  https://leetcode.com/problems/balanced-binary-tree/
//
//  Created by Erik Radicheski da Silva on 14/11/22.
//

import XCTest

final class BalancedBinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isBalanced(TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isBalanced(TreeNode.parseTree(from: [1, 2, 2, 3, 3, nil, nil, 4, 4])))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.isBalanced(TreeNode.parseTree(from: [])))
    }

}

private class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        let leftDepth = depth(root.left)
        let rightDepth = depth(root.right)
        
        return abs(leftDepth - rightDepth) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    private func depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftDepth = depth(root.left)
        let rightDepth = depth(root.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
