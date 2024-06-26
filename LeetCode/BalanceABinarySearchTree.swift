//
//  BalanceABinarySearchTree.swift
//  https://leetcode.com/problems/balance-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 26/06/24.
//

import XCTest

final class BalanceABinarySearchTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 2, nil, 3, nil, 4, nil, nil])
        let output = TreeNode.parseTree(from: [2, 1, 3, nil, nil, nil, 4])
        XCTAssertTrue(TreeNode.isEqual(solution.balanceBST(root), output))
    }
    
    func testExamplB() {
        let root = TreeNode.parseTree(from: [2, 1, 3])
        let output = TreeNode.parseTree(from: [2, 1, 3])
        XCTAssertTrue(TreeNode.isEqual(solution.balanceBST(root), output))
    }
    
}

private class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var array = [Int]()
        inorder(root, &array)
        
        return createTree(array, 0, array.endIndex - 1)
    }
    
    private func inorder(_ node: TreeNode?, _ array: inout [Int]) {
        guard let node = node else { return }
        
        inorder(node.left, &array)
        array.append(node.val)
        inorder(node.right, &array)
    }
    
    private func createTree(_ array: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard array.isEmpty == false else { return nil }
        guard right >= left else { return nil }
        
        let middle = left + (right - left) / 2
        
        let root = TreeNode(array[middle])
        
        root.left = createTree(array, left, middle - 1)
        root.right = createTree(array, middle + 1, right)
        
        return root
    }
}
