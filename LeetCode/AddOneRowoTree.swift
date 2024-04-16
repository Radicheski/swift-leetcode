//
//  AddOneRowoTree.swift
//  https://leetcode.com/problems/add-one-row-to-tree/
//
//  Created by Erik Radicheski da Silva on 16/04/24.
//

import XCTest

final class AddOneRowoTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 2, 6, 3, 1, 5])
        let result = TreeNode.parseTree(from: [4, 1, 1, 2, nil, nil, 6, 3, 1, 5])
        XCTAssertTrue(TreeNode.isEqual(solution.addOneRow(root, 1, 2), result))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [4, 2, nil, 3, 1])
        let result = TreeNode.parseTree(from: [4, 2, nil, 1, 1, 3, nil, nil, 1])
        XCTAssertTrue(TreeNode.isEqual(solution.addOneRow(root, 1, 3), result))
    }
    
}

private class Solution {
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard depth > 1 else { return TreeNode(val, root, nil) }
        
        var stack = [(root!, 1)]
        
        while stack.isEmpty == false {
            let (cur, level) = stack.removeFirst()
            
            if level < depth - 1 {
                if let left = cur.left {
                    stack.append((left, level + 1))
                }
                
                if let right = cur.right {
                    stack.append((right, level + 1))
                }
            } else if level == depth - 1 {
                cur.left = TreeNode(val, cur.left, nil)
                cur.right = TreeNode(val, nil, cur.right)
            }
        }
        
        return root
    }
}
