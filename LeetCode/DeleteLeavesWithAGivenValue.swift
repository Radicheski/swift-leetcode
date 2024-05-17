//
//  DeleteLeavesWithAGivenValue.swift
//  https://leetcode.com/problems/delete-leaves-with-a-given-value/
//
//  Created by Erik Radicheski da Silva on 17/05/24.
//

import XCTest

final class DeleteLeavesWithAGivenValue: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 2, 3, 2, nil, 2, 4])
        let expectedOutput = TreeNode.parseTree(from: [1, nil, 3, nil, 4])
        XCTAssertTrue(TreeNode.isEqual(solution.removeLeafNodes(root, 2), expectedOutput))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 3, 3, 3, 2])
        let expectedOutput = TreeNode.parseTree(from:[1, 3, nil, nil, 2])
        XCTAssertTrue(TreeNode.isEqual(solution.removeLeafNodes(root, 3), expectedOutput))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1, 2, nil, 2, nil, 2])
        let expectedOutput = TreeNode.parseTree(from:[1])
        XCTAssertTrue(TreeNode.isEqual(solution.removeLeafNodes(root, 2), expectedOutput))
    }
}

private class Solution {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        root.left = removeLeafNodes(root.left, target)
        root.right = removeLeafNodes(root.right, target)
        
        if root.left == nil && root.right == nil && root.val == target {
            return nil
        }
        
        return root
    }
}
