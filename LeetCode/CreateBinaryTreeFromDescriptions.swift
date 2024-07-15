//
//  CreateBinaryTreeFromDescriptions.swift
//  https://leetcode.com/problems/create-binary-tree-from-descriptions/
//
//  Created by Erik Radicheski da Silva on 15/07/24.
//

import XCTest

final class CreateBinaryTreeFromDescriptions: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [50, 20, 80, 15, 17, 1, 9])
        XCTAssertTrue(TreeNode.isEqual(solution.createBinaryTree([[20, 15, 1], [20, 17, 0], [50, 20, 1], [50, 80, 0], [80, 19, 1]]), root))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, nil, nil, 3, 4])
        XCTAssertTrue(TreeNode.isEqual(solution.createBinaryTree([[1, 2, 1], [2, 3, 0], [3, 4, 1]]), root))
    }
    
}

private class Solution {
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var children = Set<Int>()
        var nodes = [Int: TreeNode]()
        
        for description in descriptions {
            let parent = description[0]
            let child = description[1]
            let isLeft = description[2] == 1
            
            children.insert(child)
            
            if nodes[child] == nil {
                nodes[child] = TreeNode(child)
            }
            
            if let parentNode = nodes[parent] {
                if isLeft {
                    parentNode.left = nodes[child]
                } else {
                    parentNode.right = nodes[child]
                }
            } else {
                let parentNode = TreeNode(parent)
                nodes[parent] = parentNode
                
                if isLeft {
                    parentNode.left = nodes[child]
                } else {
                    parentNode.right = nodes[child]
                }
            }
        }
        
        return nodes.first { children.contains($0.key) == false }?.value
    }
}
