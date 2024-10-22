//
//  KthLargestSumInABinaryTree.swift
//  https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 21/10/24.
//

import XCTest

final class KthLargestSumInABinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 8, 9, 2, 1, 3, 7, 4, 6])
        XCTAssertEqual(solution.kthLargestLevelSum(root, 2), 13)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, nil, 3])
        XCTAssertEqual(solution.kthLargestLevelSum(root, 1), 3)
    }
    
}

private class Solution {
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else { return -1 }
        
        var sums = [Int]()
        var queue = [(level: 0, node: root)]
        
        while let (level, node) = queue.popLast() {
            if let left = node.left {
                queue.append((level + 1, left))
            }
            
            if let right = node.right {
                queue.append((level + 1, right))
            }
            
            while sums.indices.contains(level) == false {
                sums.append(0)
            }
            
            sums[level] += node.val
        }
        
        guard sums.count >= k else { return -1 }
        
        return sums.sorted(by: >)[k - 1]
    }
}
