//
//  FindBottomLeftTreeValue.swift
//  https://leetcode.com/problems/find-bottom-left-tree-value/
//
//  Created by Erik Radicheski da Silva on 28/02/24.
//

import XCTest

final class FindBottomLeftTreeValue: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [2, 1, 3])
        XCTAssertEqual(solution.findBottomLeftValue(root), 1)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3, 4, nil, 5, 6, nil, nil, 7])
        XCTAssertEqual(solution.findBottomLeftValue(root), 7)
    }
    
}

private class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var levels = [Int]()
        
        find(root, 0, &levels)
        
        return levels.last!
    }
    
    private func find(_ root: TreeNode?, _ level: Int, _ levels: inout [Int]) {
        guard let root = root else { return }
        
        if levels.indices.contains(level) == false {
            levels.append(root.val)
        }
        
        find(root.left, level + 1, &levels)
        find(root.right, level + 1, &levels)
    }
}
