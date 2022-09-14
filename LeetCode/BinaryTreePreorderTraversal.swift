//
//  BinaryTreePreorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-preorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreePreorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 2, 3])
        XCTAssertEqual(solution.preorderTraversal(root), [1, 2, 3])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.preorderTraversal(root), [])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.preorderTraversal(root), [1])
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
