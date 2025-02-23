//
//  ConstructBinaryTreeFromPreorderAndPostorderTraversal.swift
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
//
//  Created by Erik Radicheski da Silva on 23/02/25.
//

import XCTest

final class ConstructBinaryTreeFromPreorderAndPostorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.constructFromPrePost([1, 2, 4, 5, 3, 6, 7], [4, 5, 2, 6, 7, 3, 1])
        let expectation = TreeNode.parseTree(from: [1, 2, 3, 4, 5, 6, 7])
        XCTAssertTrue(TreeNode.isEqual(output, expectation))
    }
    
    func testExampleB() {
        let output = solution.constructFromPrePost([1], [1])
        let expectation = TreeNode.parseTree(from: [1])
        XCTAssertTrue(TreeNode.isEqual(output, expectation))
    }
    
}

private class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        assert(preorder.count == postorder.count)
        if preorder.isEmpty { return nil }
        
        let root = TreeNode(preorder[0])
        
        guard preorder.count > 1 else { return root     }
        
        if let leftPostorderIndex = postorder.firstIndex(of: preorder[1]) {
            
            let leftPreorder = Array(preorder[1 ... leftPostorderIndex + 1])
            let leftPostorder = Array(postorder[...leftPostorderIndex])
            root.left = constructFromPrePost(leftPreorder, leftPostorder)
            
            let rightPreorder = Array(preorder[(leftPostorderIndex + 2)...])
            let rightPostorder = Array(postorder[leftPostorderIndex + 1 ..< postorder.count - 1])
            root.right = constructFromPrePost(rightPreorder, rightPostorder)
        }
        
        return root
    }
}
