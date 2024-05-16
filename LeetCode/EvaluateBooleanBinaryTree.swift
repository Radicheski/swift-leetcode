//
//  EvaluateBooleanBinaryTree.swift
//  https://leetcode.com/problems/evaluate-boolean-binary-tree/
//
//  Created by Erik Radicheski da Silva on 16/05/24.
//

import XCTest

final class EvaluateBooleanBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [2, 1, 3, nil, nil, 0, 1])
        XCTAssertTrue(solution.evaluateTree(root))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [0])
        XCTAssertFalse(solution.evaluateTree(root))
    }
    
}

private class Solution {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        let value = root!.val

        if value == 0 || value == 1 { return value == 1 }

        if value == 2 { return evaluateTree(root?.left) || evaluateTree(root?.right) }

        return evaluateTree(root?.left) && evaluateTree(root?.right)
    }
}
