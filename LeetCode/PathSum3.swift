//
//  PathSum3.swift
//  https://leetcode.com/problems/path-sum-iii/
//
//  Created by Erik Radicheski da Silva on 15/11/22.
//

import XCTest

final class PathSum3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1])
        XCTAssertEqual(solution.pathSum(input, 8), 3)
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1])
        XCTAssertEqual(solution.pathSum(input, 22), 3)
    }

}

private class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var result = 0
        var sums = [Int: Int]()
        
        pathSum(&sums, root, targetSum, 0, &result)
        
        return result
    }
    
    private func pathSum(_ sums: inout [Int: Int],
                         _ root: TreeNode?,
                         _ targetSum: Int,
                         _ cumulativeSum: Int,
                         _ result: inout Int) {
        guard let root = root else { return }
        
        if cumulativeSum + root.val == targetSum {
            result += 1
        }
        
        if let count = sums[cumulativeSum + root.val - targetSum] {
            result += count
        }
        
        sums[cumulativeSum + root.val, default: 0] += 1
        
        pathSum(&sums, root.left, targetSum, cumulativeSum + root.val, &result)
        pathSum(&sums, root.right, targetSum, cumulativeSum + root.val, &result)
        
        sums[cumulativeSum + root.val]? -= 1
    }
}
