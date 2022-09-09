//
//  BinaryTreeInorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-inorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreeInorderTraversal: XCTestCase {

    func test() {
        
    }

}

private class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        
        result.append(contentsOf: inorderTraversal(root.left))
        result.append(root.val)
        result.append(contentsOf: inorderTraversal(root.right))

        return result
    }
}
