//
//  MaximumLevelSumOfABinaryTree.swift
//  https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 15/06/23.
//

import XCTest

final class MaximumLevelSumOfABinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 7, 0, 7, -8, nil, nil])
        XCTAssertEqual(solution.maxLevelSum(root), 2)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [989, nil, 10250, 98693, -89388, nil, nil, nil, -32127])
        XCTAssertEqual(solution.maxLevelSum(root), 2)
    }

}

private class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var levelSum = [root.val]
        
        sumChild(root.left, 1, &levelSum)
        sumChild(root.right, 1, &levelSum)
        
        var answer = 0
        var maxSum = Int.min
        
        for (i, sum) in levelSum.enumerated() {
            if sum > maxSum {
                answer = i + 1
                maxSum = sum
            }
        }
        
        return answer
    }
    
    private func sumChild(_ node: TreeNode?, _ level: Int, _ levelSum: inout [Int]) {
        guard let node = node else { return }
        
        if levelSum.indices.contains(level) {
            levelSum[level] += node.val
        } else {
            levelSum.append(node.val)
        }
        
        sumChild(node.left, level + 1, &levelSum)
        sumChild(node.right, level + 1, &levelSum)
    }
}
