//
//  BinarySearchTreeToGreaterSumTree.swift
//  https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
//
//  Created by Erik Radicheski da Silva on 25/06/24.
//

import XCTest

final class BinarySearchTreeToGreaterSumTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 1, 6, 0, 2, 5, 7, nil, nil, nil, 3, nil, nil, nil, 8])
        let output = TreeNode.parseTree(from: [30, 36, 21, 36, 35, 26, 15, nil, nil, nil, 33, nil, nil, nil, 8])
        XCTAssertTrue(TreeNode.isEqual(solution.bstToGst(root), output))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [0, nil, 1])
        let output = TreeNode.parseTree(from: [1, nil, 1])
        XCTAssertTrue(TreeNode.isEqual(solution.bstToGst(root), output))
    }
    
}

private class Solution {
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        greaterSum(root, &sum)
        return root
    }
    
    private func greaterSum(_ node: TreeNode?, _ sum: inout Int) {
        guard let node = node else { return }
        
        greaterSum(node.right, &sum)
        
        sum += node.val
        node.val = sum
        
        greaterSum(node.left, &sum)
    }
}
