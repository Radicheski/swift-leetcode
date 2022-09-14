//
//  BinaryTreePostorderTraversal.swift
//  https://leetcode.com/problems/binary-tree-postorder-traversal/
//
//  Created by Erik Radicheski da Silva on 09/09/22.
//

import XCTest

class BinaryTreePostorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 2, 3])
        XCTAssertEqual(solution.postorderTraversal(root), [3, 2, 1])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.postorderTraversal(root), [])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.postorderTraversal(root), [1])
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
