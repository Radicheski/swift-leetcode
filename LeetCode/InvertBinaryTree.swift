//
//  InvertBinaryTree.swift
//  https://leetcode.com/problems/invert-binary-tree/
//
//  Created by Erik Radicheski da Silva on 11/09/22.
//

import XCTest

class InvertBinaryTree: XCTestCase {

    func test() {
        
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
