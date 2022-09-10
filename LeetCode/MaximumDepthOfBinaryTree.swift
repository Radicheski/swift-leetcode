//
//  MaximumDepthOfBinaryTree.swift
//  https://leetcode.com/problems/maximum-depth-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 10/09/22.
//

import XCTest

class MaximumDepthOfBinaryTree: XCTestCase {

    func test() {
        
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
