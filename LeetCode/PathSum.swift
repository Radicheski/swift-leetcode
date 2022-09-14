//
//  PathSum.swift
//  https://leetcode.com/problems/path-sum/
//
//  Created by Erik Radicheski da Silva on 11/09/22.
//

import XCTest

class PathSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
        XCTAssertTrue(solution.hasPathSum(root, 22))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3])
        XCTAssertFalse(solution.hasPathSum(root, 5))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertFalse(solution.hasPathSum(root, 0))
    }

}

private class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if let left = root.left,
           hasPathSum(left, targetSum - root.val) {
            return true
        }
        
        if let right = root.right,
           hasPathSum(right, targetSum - root.val) {
            return true
        }
        
        return root.left == nil && root.right == nil && targetSum == root.val
    }
}
