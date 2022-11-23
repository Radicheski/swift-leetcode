//
//  SameTree.swift
//  https://leetcode.com/problems/same-tree/
//
//  Created by Erik Radicheski da Silva on 23/11/22.
//

import XCTest

final class SameTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let p = TreeNode.parseTree(from: [1, 2, 3])
        let q = TreeNode.parseTree(from: [1, 2, 3])
        XCTAssertTrue(solution.isSameTree(p, q))
    }
    
    func testExampleB() {
        let p = TreeNode.parseTree(from: [1, 2])
        let q = TreeNode.parseTree(from: [1, nil, 2])
        XCTAssertFalse(solution.isSameTree(p, q))
    }

    func testExampleC() {
        let p = TreeNode.parseTree(from: [1, 2, 1])
        let q = TreeNode.parseTree(from: [1, 1, 2])
        XCTAssertFalse(solution.isSameTree(p, q))
    }
    
}

private class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p else { return q == nil }
        guard let q = q else { return false }
        
        guard p.val == q.val else { return false }
        
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
