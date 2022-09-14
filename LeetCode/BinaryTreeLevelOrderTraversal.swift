//
//  BinaryTreeLevelOrderTraversal.swift
//  https://leetcode.com/problems/binary-tree-level-order-traversal/
//
//  Created by Erik Radicheski da Silva on 21/08/22.
//

import XCTest

class BinaryTreeLevelOrderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(solution.levelOrder(root), [[3], [9, 20], [15, 7]])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.levelOrder(root), [[1]])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.levelOrder(root), [])
    }

}

private class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var level = 1
        var queue = [level: [root]]
        var result = [[root.val]]
        
        
        while let nodes = queue[level] {
            var children = [Int]()
            for node in nodes {
                if let left = node.left {
                    queue[level + 1, default: []].append(left)
                    children.append(left.val)
                }
                if let right = node.right {
                    queue[level + 1, default: []].append(right)
                    children.append(right.val)
                }
            }
            
            if !children.isEmpty {
                result.append(children)
            }
            
            level += 1
        }
        
        
        return result
    }

}
