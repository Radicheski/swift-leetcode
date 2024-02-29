//
//  EvenOddTree.swift
//  https://leetcode.com/problems/even-odd-tree/
//
//  Created by Erik Radicheski da Silva on 29/02/24.
//

import XCTest

final class EvenOddTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 10, 4, 3, nil, 7, 9, 12, 8, 6, nil, nil, 2])
        XCTAssertTrue(solution.isEvenOddTree(root))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [5, 4, 2, 3, 3, 7])
        XCTAssertFalse(solution.isEvenOddTree(root))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [5, 9, 1, 3, 5, 7])
        XCTAssertFalse(solution.isEvenOddTree(root))
    }
    
}

private class Solution {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        var queue = [(level: 0, node: root)]
        var levels = [Int]()
        
        while queue.isEmpty == false {
            let (level, node) = queue.removeLast()
            
            if level.isMultiple(of: 2) {
                guard node.val.isMultiple(of: 2) == false else { return false }
                
                if levels.indices.contains(level) {
                    guard node.val > levels[level] else { return false }
                    levels[level] = node.val
                } else {
                    levels.append(node.val)
                }
            } else {
                guard node.val.isMultiple(of: 2) else { return false }
                
                if levels.indices.contains(level) {
                    guard node.val < levels[level] else { return false }
                    levels[level] = node.val
                } else {
                    levels.append(node.val)
                }
            }
            
            if let right = node.right {
                queue.append((level + 1, right))
            }
            
            if let left = node.left {
                queue.append((level + 1, left))
            }
        }
        
        return true
    }
}
