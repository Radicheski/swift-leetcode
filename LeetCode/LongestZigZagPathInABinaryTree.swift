//
//  LongestZigZagPathInABinaryTree.swift
//  https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 19/04/23.
//

import XCTest

final class LongestZigZagPathInABinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, nil, 1, 1, 1, nil, nil, 1, 1, nil, 1, nil, nil, nil, 1, nil, 1])
        XCTAssertEqual(solution.longestZigZag(root), 3)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 1, 1, nil, 1, nil, nil, 1, 1, nil, 1])
        XCTAssertEqual(solution.longestZigZag(root), 4)
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.longestZigZag(root), 0)
    }

}

private class Solution {
    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var longestPath = 0
        
        longestZigZag(root, .left, 0, &longestPath)
        longestZigZag(root, .right, 0, &longestPath)
        
        return longestPath
    }
    
    private func longestZigZag(_ root: TreeNode?, _ nextMove: Direction, _ steps: Int, _ longestPath: inout Int) {
        guard let root = root else { return }
        
        longestPath = max(longestPath, steps)
        
        if nextMove == .left {
            longestZigZag(root.left, .right, steps + 1, &longestPath)
            longestZigZag(root.right, .left, 1, &longestPath)
        } else if nextMove == .right {
            longestZigZag(root.left, .right, 1, &longestPath)
            longestZigZag(root.right, .left, steps + 1, &longestPath)
        }
        
    }
    
    private enum Direction {
        case left, right
        
        var next: Direction {
            switch self {
            case .left: return .right
            case .right: return .left
            }
        }
    }
}
