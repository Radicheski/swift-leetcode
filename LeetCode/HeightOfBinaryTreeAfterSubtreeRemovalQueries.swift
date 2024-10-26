//
//  HeightOfBinaryTreeAfterSubtreeRemovalQueries.swift
//  https://leetcode.com/problems/height-of-binary-tree-after-subtree-removal-queries/
//
//  Created by Erik Radicheski da Silva on 26/10/24.
//

import XCTest

final class HeightOfBinaryTreeAfterSubtreeRemovalQueries: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 3, 4, 2, nil, 6, 5, nil, nil, nil, nil, nil, 7])
        XCTAssertEqual(solution.treeQueries(root, [4]), [2])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [5, 8, 9, 2, 1, 3, 7, 4, 6])
        XCTAssertEqual(solution.treeQueries(root, [3, 2, 4, 8]), [3, 2, 3, 2])
    }
    
}

private class Solution {
    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
        guard let root = root else { return [] }
        
        var maxHeight = [Int: Int]()
        var currentMaxHeight = 0
        
        var stack = [(node: root, height: 0)]
        
        while let (node, height) = stack.popLast() {
            maxHeight[node.val] = currentMaxHeight
            currentMaxHeight = max(currentMaxHeight, height)
            
            if let right = node.right {
                stack.append((right, height + 1))
            }
            
            if let left = node.left {
                stack.append((left, height + 1))
            }
        }
        
        currentMaxHeight = 0
        
        stack = [(node: root, height: 0)]
        
        while let (node, height) = stack.popLast() {
            maxHeight[node.val] = max(currentMaxHeight, maxHeight[node.val, default: .min])
            currentMaxHeight = max(currentMaxHeight, height)
            
            if let left = node.left {
                stack.append((left, height + 1))
            }
            
            if let right = node.right {
                stack.append((right, height + 1))
            }
        }
        
        return queries.compactMap { maxHeight[$0] }
    }
}
