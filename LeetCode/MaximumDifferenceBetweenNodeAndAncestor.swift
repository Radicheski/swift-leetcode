//
//  MaximumDifferenceBetweenNodeAndAncestor.swift
//  https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/
//
//  Created by Erik Radicheski da Silva on 11/01/24.
//

import XCTest

final class MaximumDifferenceBetweenNodeAndAncestor: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [8, 3, 10, 1, 6, nil, 14, nil, nil, 4, 7, 13])
        XCTAssertEqual(solution.maxAncestorDiff(root), 7)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, nil, 2, nil, 0, 3])
        XCTAssertEqual(solution.maxAncestorDiff(root), 3)
    }
    
}

private class Solution {
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var result = Int.min
        let _ = maxAncestorDiff(root, &result)
        return result
    }
    
    private func maxAncestorDiff(_ root: TreeNode?, _ result: inout Int) -> (min: Int?, max: Int?) {
        guard let root = root else { return (nil, nil) }
        
        if root.left == nil && root.right == nil {
            return (root.val, root.val)
        }
        
        let left: (min: Int?, max: Int?) = maxAncestorDiff(root.left, &result)
        let right: (min: Int?, max: Int?) = maxAncestorDiff(root.right, &result)
        
        var newMin = root.val
        var newMax = root.val
        
        if let leftMax = left.max {
            result = max(result, abs(root.val - leftMax))
            newMin = min(newMin, leftMax)
            newMax = max(newMax, leftMax)
        }
        
        if let leftMin = left.min {
            result = max(result, abs(root.val - leftMin))
            newMin = min(newMin, leftMin)
            newMax = max(newMax, leftMin)
        }
        
        if let rightMax = right.max {
            result = max(result, abs(root.val - rightMax))
            newMin = min(newMin, rightMax)
            newMax = max(newMax, rightMax)
        }
        
        if let rightMin = right.min {
            result = max(result, abs(root.val - rightMin))
            newMin = min(newMin, rightMin)
            newMax = max(newMax, rightMin)
        }
        
        return (newMin, newMax)
    }
}
