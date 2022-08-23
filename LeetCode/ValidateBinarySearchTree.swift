//
//  ValidateBinarySearchTree.swift
//  https://leetcode.com/problems/validate-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 23/08/22.
//

import XCTest

class ValidateBinarySearchTree: XCTestCase {

    func test() {
//        XCTAssertTrue([2, 1, 3])
//        XCTAssertFalse([5, 1, 4, nil, nil, 3, 6])
    }

}

private class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var leftResult = true
        var rightResult = true
        
        if let left = root.left {
            if left.val >= root.val {
                return false
            } else {
                leftResult = isValidBST(left) && (maxValue(left) < root.val)
            }
        }
        
        if let right = root.right {
            if right.val <= root.val {
                return false
            } else {
                rightResult = isValidBST(right) && (minValue(right) > root.val)
            }
        }
        
        return leftResult && rightResult
    }
    
    private func maxValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return Int.min }
        
        var leftMax = Int.min
        var rightMax = Int.min
        
        if let left = root.left {
            leftMax = maxValue(left)
        }
        
        if let right = root.right {
            rightMax = maxValue(right)
        }
        
        return root.val > max(leftMax, rightMax) ? root.val : max(leftMax, rightMax)
    }
    
    private func minValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return Int.max }
        
        var leftMin = Int.max
        var rightMin = Int.max
        
        if let left = root.left {
            leftMin = minValue(left)
        }
        
        if let right = root.right {
            rightMin = minValue(right)
        }
        
        return root.val < min(leftMin, rightMin) ? root.val : min(leftMin, rightMin)
    }
}
