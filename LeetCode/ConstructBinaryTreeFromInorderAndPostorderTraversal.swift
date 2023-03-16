//
//  ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
//
//  Created by Erik Radicheski da Silva on 16/03/23.
//

import XCTest

final class ConstructBinaryTreeFromInorderAndPostorderTraversal: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let expectedOutput = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        let output = solution.buildTree([9, 3, 15, 20, 7], [9, 15, 7, 20, 3])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }
    
    func testExampleB() {
        let expectedOutput = TreeNode.parseTree(from: [-1])
        let output = solution.buildTree([-1], [-1])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }

}

private  class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.isEmpty == false else { return nil }
        
        var postorder = postorder
        
        let rootVal = postorder.removeLast()
        
        let root = TreeNode(rootVal)
        
        guard let index = inorder.firstIndex(of: rootVal) else { return root }
        
        let leftInorder = Array(inorder[..<index])
        let rightInorder = Array(inorder[(index + 1)...])
        
        let leftPostorder = Array(postorder[..<leftInorder.count])
        let rightPostorder = Array(postorder[leftInorder.count...])
        
        root.left = buildTree(leftInorder, leftPostorder)
        root.right = buildTree(rightInorder, rightPostorder)
        
        return root
    }
}
