//
//  InvertBinaryTree.swift
//  https://leetcode.com/problems/invert-binary-tree/
//
//  Created by Erik Radicheski da Silva on 11/09/22.
//

import XCTest

class InvertBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 2, 7, 1, 3, 6, 9])
        let output = solution.invertTree(root)
        let expectedOutput = TreeNode.parseTree(from: [4, 7, 2, 9, 6, 3, 1])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [2, 1, 3])
        let output = solution.invertTree(root)
        let expectedOutput = TreeNode.parseTree(from: [2, 3, 1])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [])
        let output = solution.invertTree(root)
        let expectedOutput = TreeNode.parseTree(from: [])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        
        let newLeft = invertTree(root?.right)
        let newRight = invertTree(root?.left)
        
        root?.left = newLeft
        root?.right = newRight
        
        return root
    }
}
