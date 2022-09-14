//
//  InsertIntoABinarySearchTree.swift
//  https://leetcode.com/problems/insert-into-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 12/09/22.
//

import XCTest

class InsertIntoABinarySearchTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 2, 7, 1, 3])
        let output = solution.insertIntoBST(root, 5)
        let expectedOutput = TreeNode.parseTree(from: [4, 2, 7, 1, 3, 5])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [40, 20, 60, 10, 30, 50, 70])
        let output = solution.insertIntoBST(root, 25)
        let expectedOutput = TreeNode.parseTree(from: [40, 20, 60, 10, 30, 50, 70, nil, nil, 25])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [4, 2, 7, 1, 3, nil, nil, nil, nil, nil, nil])
        let output = solution.insertIntoBST(root, 5)
        let expectedOutput = TreeNode.parseTree(from: [4, 2, 7, 1, 3, 5])
        XCTAssertTrue(TreeNode.isEqual(output, expectedOutput))
    }

}

private class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }

        var nodes: [TreeNode] = [root]
        
        repeat {
            let nextNode = nodes.removeFirst()
            
            if val < nextNode.val {
                if let leftNode = nextNode.left {
                    nodes.append(leftNode)
                } else {
                    nextNode.left = TreeNode(val)
                    break
                }
            }
            
            if val > nextNode.val {
                if let rightNode = nextNode.right {
                    nodes.append(rightNode)
                } else {
                    nextNode.right = TreeNode(val)
                    break
                }
            }
            
        } while !nodes.isEmpty
        
        return root
    }
}
