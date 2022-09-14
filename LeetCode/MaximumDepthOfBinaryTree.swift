//
//  MaximumDepthOfBinaryTree.swift
//  https://leetcode.com/problems/maximum-depth-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 10/09/22.
//

import XCTest

class MaximumDepthOfBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(solution.maxDepth(root), 3)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, nil, 2])
        XCTAssertEqual(solution.maxDepth(root), 2)
    }

}

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
