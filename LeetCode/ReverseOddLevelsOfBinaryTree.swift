//
//  ReverseOddLevelsOfBinaryTree.swift
//  https://leetcode.com/problems/reverse-odd-levels-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 20/12/24.
//

import XCTest

final class ReverseOddLevelsOfBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [2, 3, 5, 8, 13, 21, 34])
        let output = TreeNode.parseTree(from: [2, 5, 3, 8, 13, 21, 34])
        XCTAssertTrue(TreeNode.isEqual(solution.reverseOddLevels(root), output))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [7, 13, 11])
        let output = TreeNode.parseTree(from: [7, 11, 13])
        XCTAssertTrue(TreeNode.isEqual(solution.reverseOddLevels(root), output))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2])
        let output = TreeNode.parseTree(from: [0, 2, 1, 0, 0, 0, 0, 2, 2, 2, 2, 1, 1, 1, 1])
        XCTAssertTrue(TreeNode.isEqual(solution.reverseOddLevels(root), output))
    }
    
}

private class Solution {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        reverseOddLevels(root?.left, root?.right, 0)
        return root
    }
    
    private func reverseOddLevels(_ left: TreeNode?, _ right: TreeNode?, _  level: Int) {
        guard let left = left, let right = right else { return }
        
        if level.isMultiple(of: 2) {
            left.val ^= right.val
            right.val ^= left.val
            left.val ^= right.val
        }
        
        reverseOddLevels(left.right, right.left, level + 1)
        reverseOddLevels(left.left, right.right, level + 1)
    }
}
