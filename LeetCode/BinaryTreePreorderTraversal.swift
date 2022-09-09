//
//  BinaryTreePreorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-preorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreePreorderTraversal: XCTestCase {

    func test(){
        
    }

}

private class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        
        result.append(root.val)
        result.append(contentsOf: preorderTraversal(root.left))
        result.append(contentsOf: preorderTraversal(root.right))

        return result
    }
}
