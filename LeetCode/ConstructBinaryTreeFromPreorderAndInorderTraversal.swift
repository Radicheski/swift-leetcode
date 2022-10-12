//
//  ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
//
//  Created by Erik Radicheski da Silva on 12/10/22.
//

import XCTest

final class ConstructBinaryTreeFromPreorderAndInorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let expectedOutput = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        let output = solution.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }
    
    func testExampleB() {
        let expectedOutput = TreeNode.parseTree(from: [-1])
        let output = solution.buildTree([-1], [-1])
        XCTAssertTrue(TreeNode.isEqual(expectedOutput, output))
    }

}

private class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return Helper.buildTree(preorder, inorder)
    }
    
    private class Helper {
        private var preorderIndex: Int
        private let inorderIndexMap: [Int: Int]
        private let preorder: [Int]
        
        private var count: Int {
            preorder.count
        }
        
        private init(_ preorder: [Int], _ inorder: [Int]) {
            self.preorderIndex = 0
            self.inorderIndexMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
            self.preorder = preorder
        }
        
        static func buildTree(_ preoder: [Int], _ inorder: [Int]) -> TreeNode? {
            let helper = Helper(preoder, inorder)
            return helper.buildTree(0, helper.count - 1)
        }
        
        private func buildTree(_ left: Int, _ right: Int) -> TreeNode? {
            guard left <= right else { return nil }
            
            let rootValue = preorder[preorderIndex]
            preorderIndex += 1
            let root = TreeNode(rootValue)
            
            root.left = buildTree(left, inorderIndexMap[rootValue]! - 1)
            root.right = buildTree(inorderIndexMap[rootValue]! + 1, right)
            
            return root
        }
    }
}
