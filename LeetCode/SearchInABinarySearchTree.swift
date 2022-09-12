//
//  SearchInABinarySearchTree.swift
//  https://leetcode.com/problems/search-in-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 12/09/22.
//

import XCTest

class SearchInABinarySearchTree: XCTestCase {

    func test() {
        
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
