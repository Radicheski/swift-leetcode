//
//  PathSum.swift
//  https://leetcode.com/problems/path-sum/
//
//  Created by Erik Radicheski da Silva on 11/09/22.
//

import XCTest

class PathSum: XCTestCase {

    func test() {
        
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
