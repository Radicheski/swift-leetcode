//
//  MaximumWidthOfBinaryTree.swift
//  https://leetcode.com/problems/maximum-width-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 20/04/23.
//

import XCTest

final class MaximumWidthOfBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 3, 2, 5, 3, nil, 9])
        XCTAssertEqual(solution.widthOfBinaryTree(root), 4)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 3, 2, 5, nil, nil, 9, 6, nil, 7])
        XCTAssertEqual(solution.widthOfBinaryTree(root), 7)
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1, 3, 2, 5])
        XCTAssertEqual(solution.widthOfBinaryTree(root), 2)
    }

}

private class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var levels = [Int: Int]()
        return depthFirst(root, 0, 1, &levels)
    }
    
    private func depthFirst(_ root: TreeNode?, _ level: Int, _ index: Int, _ levels: inout [Int: Int]) -> Int {
        guard let root = root else { return 0 }
        
        if levels[level] == nil {
            levels[level] = index
        }
        
        let startIndex = levels[level]!
        
        let currentWidth = index - startIndex + 1
        
        let leftWidth = depthFirst(root.left, level + 1, 2 * index - startIndex, &levels)
        let rightWidth = depthFirst(root.right, level + 1, 2 * index - startIndex + 1, &levels)
        
        return max(currentWidth, leftWidth, rightWidth)
    }
}
