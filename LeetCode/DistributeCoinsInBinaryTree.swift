//
//  DistributeCoinsInBinaryTree.swift
//  https://leetcode.com/problems/distribute-coins-in-binary-tree/
//
//  Created by Erik Radicheski da Silva on 18/05/24.
//

import XCTest

final class DistributeCoinsInBinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 0, 0])
        XCTAssertEqual(solution.distributeCoins(root), 2)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [0, 3, 0])
        XCTAssertEqual(solution.distributeCoins(root), 3)
    }
    
}

private class Solution {
    func distributeCoins(_ root: TreeNode?) -> Int {
        var moves = 0
        
        let _ = exchangeCoins(root, &moves)
        
        return moves
    }
    
    private func exchangeCoins(_ root: TreeNode?, _ moves: inout Int) -> Int {
        guard let root = root else { return 0 }
        
        let left = exchangeCoins(root.left, &moves)
        let right = exchangeCoins(root.right, &moves)
        
        moves += abs(left) + abs(right)
        
        return root.val + left + right - 1
    }
}
