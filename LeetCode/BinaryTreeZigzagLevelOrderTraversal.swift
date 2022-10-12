//
//  BinaryTreeZigzagLevelOrderTraversal.swift
//  https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
//
//  Created by Erik Radicheski da Silva on 12/10/22.
//

import XCTest

final class BinaryTreeZigzagLevelOrderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(solution.zigzagLevelOrder(input), [[3], [20, 9], [15, 7]])
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.zigzagLevelOrder(input), [[1]])
    }
    
    func testExampleC() {
        let input = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.zigzagLevelOrder(input), [])
    }
}

private class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        traverse(root: root, array: &result)
        return result
    }
    
    private func traverse(root: TreeNode?, array: inout [[Int]], level: Int = 0) {
        guard let root = root else { return }

        if array.count <= level {
            array.append([])
        }
        
        if level.isMultiple(of: 2) {
            array[level].append(root.val)
        } else {
            array[level].insert(root.val, at: 0)
        }
        
        traverse(root: root.left, array: &array, level: level + 1)
        traverse(root: root.right, array: &array, level: level + 1)
    }
}
