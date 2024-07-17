//
//  DeleteNodesAndReturnForest.swift
//  https://leetcode.com/problems/delete-nodes-and-return-forest/
//
//  Created by Erik Radicheski da Silva on 17/07/24.
//

import XCTest

final class DeleteNodesAndReturnForest: XCTestCase {
    
    //TODO: Test cases
    
}

private class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else { return [] }
        
        var nodes = [Int: TreeNode]()
        var parents = [Int: TreeNode]()
        
        var queue = [root]
        
        while let node = queue.popLast() {
            nodes[node.val] = node
            
            if let left = node.left {
                parents[left.val] = node
                queue.append(left)
            }
            
            if let right = node.right {
                parents[right.val] = node
                queue.append(right)
            }
        }
        
        for node in to_delete {
            if let parent = parents[node] {
                if parent.left?.val == node {
                    parent.left = nil
                } else if parent.right?.val == node {
                    parent.right = nil
                }
            }
            
            if let current = nodes[node] {
                if let left = current.left {
                    parents[left.val] = nil
                }
                if let right = current.right {
                    parents[right.val] = nil
                }
            }
            
            nodes[node] = nil
        }
        
        return nodes.filter { parents[$0.key] == nil }.map(\.value)
    }
}
