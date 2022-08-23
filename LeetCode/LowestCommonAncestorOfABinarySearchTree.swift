//
//  LowestCommonAncestorOfABinarySearchTree.swift
//  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 23/08/22.
//

import XCTest

class LowestCommonAncestorOfABinarySearchTree: XCTestCase {
    
    func test() {
        //        XCTAssertEqual(root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8, 6)
        //        XCTAssertEqual(root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4, 2)
        //        XCTAssertEqual(root = [2,1], p = 2, q = 1, 2)
    }
    
}

private class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if contains(root?.left, p) && contains(root?.left, q) {
            return lowestCommonAncestor(root?.left, p, q)
        } else if contains(root?.right, p) && contains(root?.right, q) {
            return lowestCommonAncestor(root?.right, p, q)
        }
        return root
    }
    
    private func contains(_ root: TreeNode?, _ p: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        if root === p { return true }
        
        let leftResult = contains(root.left, p)
        let rightResult = contains(root.right, p)
        
        return leftResult || rightResult
    }
}
