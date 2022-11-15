//
//  DiameterOfBinaryTree.swift
//  https://leetcode.com/problems/diameter-of-binary-tree/
//
//  Created by Erik Radicheski da Silva on 15/11/22.
//

import XCTest

final class DiameterOfBinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [1, 2, 3, 4, 5])
        XCTAssertEqual(solution.diameterOfBinaryTree(input), 3)
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [1, 2])
        XCTAssertEqual(solution.diameterOfBinaryTree(input), 1  )
    }

}

private class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let both = depth(root.left) + depth(root.right)
        
        let left = diameterOfBinaryTree(root.left)
        let right = diameterOfBinaryTree(root.right)
        
        return max(both, left, right)
    }
    
    private func depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = depth(root.left)
        let right = depth(root.right)
        
        return max(left, right) + 1
    }
}
