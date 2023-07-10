//
//  MinimumDepthOfBinaryTree.swift
//  https://leetcode.com/problems/minimum-depth-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 10/07/23.
//

import XCTest

final class MinimumDepthOfBinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(solution.minDepth(root), 2)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [2, nil, 3, nil, 4, nil, 5, nil, 6])
        XCTAssertEqual(solution.minDepth(root), 5)
    }

}

private class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var minLevel = Int.max
        let currentLevel = 1
        
        if root.left == nil && root.right == nil {
            return currentLevel
        } else {
            if let left = root.left {
                minDepth(left, currentLevel + 1, &minLevel)
            }
            
            if let right = root.right {
                minDepth(right, currentLevel + 1, &minLevel)
            }
        }
        
        
        return minLevel
    }
    
    private func minDepth(_ root: TreeNode, _ level: Int, _ minLevel: inout Int) {
        if root.left == nil && root.right == nil {
            minLevel = min(minLevel, level)
        } else {
            if let left = root.left {
                minDepth(left, level + 1, &minLevel)
            }
            
            if let right = root.right {
                minDepth(right, level + 1, &minLevel)
            }
        }
    }

}
