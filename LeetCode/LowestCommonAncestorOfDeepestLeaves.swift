//
//  LowestCommonAncestorOfDeepestLeaves.swift
//  https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/description/?envType=daily-question&envId=2025-04-04
//
//  Created by Erik Radicheski da Silva on 04/04/25.
//

import XCTest

final class LowestCommonAncestorOfDeepestLeaves: XCTestCase {
}

private class Solution {
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        return depthFirst(root).node
    }
    
    private func depthFirst(_ root: TreeNode?) -> (node: TreeNode?, depth: Int) {
        guard let root = root else { return (nil, 0) }
        
        let (leftNode, leftDepth) = depthFirst(root.left)
        let (rightNode, rightDepth) = depthFirst(root.right)
        
        if leftDepth > rightDepth {
            return (leftNode, leftDepth + 1)
        }
        
        if leftDepth < rightDepth {
            return (rightNode, rightDepth + 1)
        }
        
        return (root, leftDepth + 1)
    }
}
