//
//  FlipEquivalentBinaryTrees.swift
//  https://leetcode.com/problems/flip-equivalent-binary-trees/
//
//  Created by Erik Radicheski da Silva on 24/10/24.
//

import XCTest

final class FlipEquivalentBinaryTrees: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root1 = TreeNode.parseTree(from: [1, 2, 3, 4, 5, 6, nil, nil, nil, 7, 8])
        let root2 = TreeNode.parseTree(from: [1, 3, 2, nil, 6, 4, 5, nil, nil, nil, nil, 8, 7])
        XCTAssertTrue(solution.flipEquiv(root1, root2))
    }
    
    func testExampleB() {
        let root1 = TreeNode.parseTree(from: [])
        let root2 = TreeNode.parseTree(from: [])
        XCTAssertTrue(solution.flipEquiv(root1, root2))
    }
    
    func testExampleC() {
        let root1 = TreeNode.parseTree(from: [])
        let root2 = TreeNode.parseTree(from: [1])
        XCTAssertFalse(solution.flipEquiv(root1, root2))
    }
    
}

private class Solution {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1 = root1, let root2 = root2 else { return root1?.val == root2?.val }
        guard root1.val == root2.val else { return false }
        
        return (flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right))
            || (flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left))
    }
}
