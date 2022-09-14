//
//  SearchInABinarySearchTree.swift
//  https://leetcode.com/problems/search-in-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 12/09/22.
//

import XCTest

class SearchInABinarySearchTree: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 2, 7, 1, 3])
        let output = solution.searchBST(root, 2)
        let expectedOutput = TreeNode.parseTree(from: [2, 1, 3])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [4, 2, 7, 1, 3])
        let output = solution.searchBST(root, 5)
        let expectedOutput = TreeNode.parseTree(from: [])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == val { return root }
        
        if let leftRoot = searchBST(root.left, val) { return leftRoot }
        if let rightRoot = searchBST(root.right, val) { return rightRoot }
        
        return nil
    }
}
