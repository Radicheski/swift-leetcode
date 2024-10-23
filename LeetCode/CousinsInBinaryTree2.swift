//
//  CousinsInBinaryTree2.swift
//  https://leetcode.com/problems/cousins-in-binary-tree-ii/
//
//  Created by Erik Radicheski da Silva on 23/10/24.
//

import XCTest

final class CousinsInBinaryTree2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 4, 9, 1, 10, nil, 7])
        let output = TreeNode.parseTree(from: [0, 0, 0, 7, 7, nil, 11])
        XCTAssertTrue(TreeNode.isEqual(solution.replaceValueInTree(root), output))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [3, 1, 2])
        let output = TreeNode.parseTree(from: [0, 0, 0])
        XCTAssertTrue(TreeNode.isEqual(solution.replaceValueInTree(root), output))
    }
    
}

private class Solution {
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        var stack = [(level: 0, node: root)]
        var sum = [Int]()
        
        while let (level, node) = stack.popLast() {
            while sum.indices.contains(level) == false {
                sum.append(0)
            }
            
            sum[level] += node.val
            
            if let left = node.left {
                stack.append((level + 1, left))
            }
            
            if let right = node.right {
                stack.append((level + 1, right))
            }
        }
        
        root.val = 0
        
        stack.removeAll(keepingCapacity: true)
        stack.append((0, root))
        
        while let (level, node) = stack.popLast() {
            var childrenSum = 0
            
            if let left = node.left {
                childrenSum += left.val
                stack.append((level + 1, left))
            }
            
            if let right = node.right {
                childrenSum += right.val
                stack.append((level + 1, right))
            }
            
            if childrenSum > 0 {
                node.left?.val = sum[level + 1] - childrenSum
                node.right?.val = sum[level + 1] - childrenSum
            }
        }
        
        return root
    }
}
