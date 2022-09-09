//
//  BinaryTreePostorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-postorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreePostorderTraversal: XCTestCase {

    func test() {
        
    }

}

private class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        
        result.append(contentsOf: postorderTraversal(root.left))
        result.append(contentsOf: postorderTraversal(root.right))
        result.append(root.val)

        return result
    }
}
