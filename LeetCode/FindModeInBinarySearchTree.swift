//
//  FindModeInBinarySearchTree.swift
//  https://leetcode.com/problems/find-mode-in-binary-search-tree/
//
//  Created by Erik Radicheski da Silva on 01/11/23.
//

import XCTest

final class FindModeInBinarySearchTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 2, 2])
        XCTAssertEqual(solution.findMode(root), [2])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [0])
        XCTAssertEqual(solution.findMode(root), [0])
    }

}

private class Solution {
    func findMode(_ root: TreeNode?) -> [Int] {
        var frequency = [Int: Int]()
        var mode = Int.min
        
        var queue = [root!]
        
        while let node = queue.popLast() {
            let newFrequency = frequency[node.val, default: 0] + 1
            frequency[node.val] = newFrequency
            mode = max(mode, newFrequency)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        return frequency.filter { $0.value == mode }.map { $0.key }
    }
}
