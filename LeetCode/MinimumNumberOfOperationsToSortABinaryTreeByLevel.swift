//
//  MinimumNumberOfOperationsToSortABinaryTreeByLevel.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-sort-a-binary-tree-by-level/
//
//  Created by Erik Radicheski da Silva on 23/12/24.
//

import XCTest

final class MinimumNumberOfOperationsToSortABinaryTreeByLevel: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 4, 3, 7, 6, 8, 5, nil, nil, nil, nil, 9, nil, 10])
        XCTAssertEqual(solution.minimumOperations(root), 3)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 3, 2, 7, 6, 5, 4])
        XCTAssertEqual(solution.minimumOperations(root), 3)
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1, 2, 3, 4, 5, 6])
        XCTAssertEqual(solution.minimumOperations(root), 0)
    }
    
}

private class Solution {
    func minimumOperations(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var levels = [[Int]]()
        
        var queue = [(node: root, level: 0)]
        
        while queue.isEmpty == false {
            let (node, level) = queue.removeFirst()
            
            if levels.indices.contains(level) == false {
                levels.append(contentsOf: Array(repeating: [], count: levels.count - level + 1))
            }
            
            levels[level].append(node.val)
            
            if let left = node.left {
                queue.append((left, level + 1))
            }
            
            if let right = node.right {
                queue.append((right, level + 1))
            }
        }
        
        var swaps = 0
        
        for level in levels {
            var level = level
            let sortedLevel = level.sorted()
            
            var indices = Dictionary(uniqueKeysWithValues: level.enumerated().map { ($0.element, $0.offset) })
            
            for i in level.indices {
                if level[i] == sortedLevel[i] { continue }
                
                swaps += 1
                
                if let index = indices[sortedLevel[i]] {
                    level[index] = level[i]
                    indices[level[i]] = index
                }
            }
        }
        
        return swaps
    }
}
