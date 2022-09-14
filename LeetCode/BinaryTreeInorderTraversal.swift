//
//  BinaryTreeInorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-inorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreeInorderTraversal: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 2, 3])
        XCTAssertEqual(solution.inorderTraversal(root), [1, 3, 2])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.inorderTraversal(root), [])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.inorderTraversal(root), [1])
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
