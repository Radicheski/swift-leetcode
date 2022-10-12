//
//  ConvertSortedArrayToBinarySearchTree.swift
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 12/10/22.
//

import XCTest

final class ConvertSortedArrayToBinarySearchTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let expectedOutputA = TreeNode.parseTree(from: [0, -3, 9, -10, nil, 5])
        let expectedOutputB = TreeNode.parseTree(from: [0, -10, 5, nil, -3, nil, 9])
        let output = solution.sortedArrayToBST([-10, -3, 0, 5, 9])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutputA) || TreeNode.isEqual(output, expectedOutputB))
    }
    
    func testExampleB() {
        let expectedOutputA = TreeNode.parseTree(from: [3, 1])
        let expectedOutputB = TreeNode.parseTree(from: [1, nil, 3])
        let output = solution.sortedArrayToBST([1, 3])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutputA) || TreeNode.isEqual(output, expectedOutputB))
    }

}

private class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return createBST(nums, left: 0, right: nums.count - 1)
    }
    
    func createBST(_ nums: [Int], left: Int, right: Int) -> TreeNode? {
        guard left <= right else { return nil }
        
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        
        root.left = createBST(nums, left: left, right: mid - 1)
        root.right = createBST(nums, left: mid + 1, right: right)
        
        return root
    }
}
