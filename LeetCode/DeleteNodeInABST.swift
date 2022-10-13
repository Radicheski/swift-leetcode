//
//  DeleteNodeInABST.swift
//  https://leetcode.com/problems/delete-node-in-a-bst/
//
//  Created by Erik Radicheski da Silva on 13/10/22.
//

import XCTest

final class DeleteNodeInABST: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 3, 6, 2, 4, nil, 7])
        let output = solution.deleteNode(root, 3)
        let expectedOutputA = TreeNode.parseTree(from: [5, 4, 6, 2, nil, nil, 7])
        let expectedOutputB = TreeNode.parseTree(from: [5, 2, 6, nil, 4, nil, 7])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutputA) || TreeNode.isEqual(output, expectedOutputB))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [5, 3, 6, 2, 4, nil, 7])
        let output = solution.deleteNode(root, 0)
        XCTAssertTrue(TreeNode.isEqual(root, output))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [])
        let output = solution.deleteNode(root, 0)
        XCTAssertTrue(TreeNode.isEqual(root, output))
    }
    
}

private class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        var values = inorder(root)
        
        if values.contains(key) == false { return root }
        
        values.removeAll { $0 == key }
        
        return createTree(values)
    }
    
    private func createTree(_ values: [Int]) -> TreeNode? {
        guard values.count > 0 else { return nil }
        
        let middleIndex = values.count / 2
        
        let root = TreeNode(values[middleIndex])
        
        if middleIndex == 0 { return root }
        
        let left = Array(values[0 ..< middleIndex])
        root.left = createTree(left)
        
        if middleIndex + 1 < values.count {
            let right = Array(values[(middleIndex + 1)...])
            root.right = createTree(right)
        }
        
        return root
    }
    
    private func inorder(_ tree: TreeNode?) -> [Int] {
        guard let tree = tree else { return [] }
        
        let left = inorder(tree.left)
        let right = inorder(tree.right)
        
        var result = [Int]()
        result.append(contentsOf: left)
        result.append(tree.val)
        result.append(contentsOf: right)
        
        return result
    }
}
