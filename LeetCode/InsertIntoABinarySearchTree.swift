//
//  InsertIntoABinarySearchTree.swift
//  https://leetcode.com/problems/insert-into-a-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 12/09/22.
//

import XCTest

class InsertIntoABinarySearchTree: XCTestCase {

    func test() {
        
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
