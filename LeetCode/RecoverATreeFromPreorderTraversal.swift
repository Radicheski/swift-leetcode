//
//  RecoverATreeFromPreorderTraversal.swift
//  https://leetcode.com/problems/recover-a-tree-from-preorder-traversal/
//
//  Created by Erik Radicheski da Silva on 22/02/25.
//

import XCTest

final class RecoverATreeFromPreorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = TreeNode.parseTree(from: [1, 2, 5, 3, 4, 6, 7])
        XCTAssertTrue(TreeNode.isEqual(solution.recoverFromPreorder("1-2--3--4-5--6--7"), output))
    }
    
    func testExampleB() {
        let output = TreeNode.parseTree(from: [1, 2, 5, 3, nil, 6, nil, 4, nil, 7])
        XCTAssertTrue(TreeNode.isEqual(solution.recoverFromPreorder("1-2--3---4-5--6---7"), output))
    }
    
    func testExampleC() {
        let output = TreeNode.parseTree(from: [1, 401, nil, 349, 88, 90])
        XCTAssertTrue(TreeNode.isEqual(solution.recoverFromPreorder("1-401--349---90--88"), output))
    }
    
}

private class Solution {
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        var nodes = [(level: Int, value: Int)]()
        var traversal = Array(traversal.reversed())
        
        var level = 0
        var value = 0
        var lastCharacter: Character?
        
        while let character = traversal.popLast() {
            if let digit = character.hexDigitValue {
                value *= 10
                value += digit
            } else {
                if let _ = lastCharacter?.hexDigitValue {
                    nodes.append((level, value))
                    value = 0
                    level = 0
                }
                level += 1
            }
            
            lastCharacter = character
        }
        
        nodes.append((level, value))
        
        let root = TreeNode()
        
        recoverFromPreorder(root, 0, nodes)

        return root
    }
    
    private func recoverFromPreorder(_ root: TreeNode, _ level: Int, _ children: [(level: Int, value: Int)]) {
        root.val = children[0].value
        
        guard children.count > 1 else { return }
        
        var nodes = [[(level: Int, value: Int)]]()
                     
        for child in children.suffix(from: 1) {
            if child.level == level + 1 {
                nodes.append([])
            }
            nodes[nodes.endIndex - 1].append(child)
        }
        
        let left = TreeNode()
        root.left = left
        recoverFromPreorder(left, level + 1, nodes[0])
        
        guard nodes.count > 1 else { return }
        
        let right = TreeNode()
        root.right = right
        recoverFromPreorder(right, level + 1, nodes[1])
    }
}
