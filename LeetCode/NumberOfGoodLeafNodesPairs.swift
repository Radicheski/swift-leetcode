//
//  NumberOfGoodLeafNodesPairs.swift
//  https://leetcode.com/problems/number-of-good-leaf-nodes-pairs/
//
//  Created by Erik Radicheski da Silva on 18/07/24.
//

import XCTest

final class NumberOfGoodLeafNodesPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 2, 3, nil, 4])
        XCTAssertEqual(solution.countPairs(root, 3), 1)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(solution.countPairs(root, 3), 2)
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [7, 1, 4, 6, nil, 5, 3, nil, nil, nil, nil, nil, 2])
        XCTAssertEqual(solution.countPairs(root, 3), 1)
    }
    
}

private class Solution {
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        var result = 0
        let _ = depthFirst(root, distance, &result)
        return result
    }
    
    private func depthFirst(_ node: TreeNode?, _ distance: Int, _ count: inout Int) -> [Int] {
        guard let node else { return [] }
        
        let left = depthFirst(node.left, distance, &count)
        let right = depthFirst(node.right, distance, &count)
        
        if left.count + right.count == 0 { return [1] }
        
        for l in left {
            for r in right where l + r <= distance {
                count += 1
            }
        }
        
        return (left + right).map { $0 + 1 }
    }
}
