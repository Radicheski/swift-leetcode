//
//  MergeTwoBinaryTrees.swift
//  https://leetcode.com/problems/merge-two-binary-trees/
//
//  Created by Erik Radicheski da Silva on 21/09/22.
//

import XCTest

final class MergeTwoBinaryTrees: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root1 = TreeNode.parseTree(from: [1, 3, 2, 5])
        let root2 = TreeNode.parseTree(from: [2, 1, 3, nil, 4, nil, 7])
        let output = solution.mergeTrees(root1, root2)
        let expectedOutput = TreeNode.parseTree(from: [3, 4, 5, 5, 4, nil, 7])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }
    
    func testExampleB() {
        let root1 = TreeNode.parseTree(from: [1])
        let root2 = TreeNode.parseTree(from: [1, 2])
        let output = solution.mergeTrees(root1, root2)
        let expectedOutput = TreeNode.parseTree(from: [2, 2])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }

}

private class Solution {
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        root1.val += root2.val
        
        root1.left = mergeTrees(root1.left, root2.left)
        root1.right = mergeTrees(root1.right, root2.right)
        
        return root1
    }
    
}
