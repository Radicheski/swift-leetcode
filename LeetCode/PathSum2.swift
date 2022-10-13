//
//  PathSum2.swift
//  https://leetcode.com/problems/path-sum-ii/
//
//  Created by Erik Radicheski da Silva on 13/10/22.
//

import XCTest

final class PathSum2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1])
        XCTAssertEqual(solution.pathSum(root, 22), [[5, 4, 11, 2], [5, 8, 4, 5]])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3])
        XCTAssertEqual(solution.pathSum(root, 5), [])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1, 2])
        XCTAssertEqual(solution.pathSum(root, 0), [])
    }
}

private class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        
        if root.left == nil && root.right == nil {
            return targetSum == root.val ? [[root.val]] : []
        }
        
        var result = [[Int]]()
        
        let left = pathSum(root.left, targetSum - root.val)
        if left.count > 0 {
            result.append(contentsOf: left)
        }
        
        let right = pathSum(root.right, targetSum - root.val)
        if right.count > 0 {
            result.append(contentsOf: right)
        }
        
        result = result.reduce(into: []) {
            var array = [root.val]
            array.append(contentsOf: $1)
            $0.append(array)
        }.filter { $0.reduce(into: 0, +=) == targetSum }
        
        return result
    }
}
