//
//  BinaryTreeRightSideView.swift
//  https://leetcode.com/problems/binary-tree-right-side-view/
//
//  Created by Erik Radicheski da Silva on 13/10/22.
//

import XCTest

final class BinaryTreeRightSideView: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 2, 3, nil, 5, nil, 4])
        XCTAssertEqual(solution.rightSideView(root), [1, 3, 4])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, nil, 3])
        XCTAssertEqual(solution.rightSideView(root), [1, 3])
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [])
        XCTAssertEqual(solution.rightSideView(root), [])
    }
    
}

private class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [root.val]
        
        var nextLevel = [root.left, root.right]
        
        repeat {
            
            let currentLevel = nextLevel.compactMap { $0 }
            guard currentLevel.count > 0 else { break }
            
            nextLevel.removeAll(keepingCapacity: true)
            
            result.append(currentLevel.last!.val)
            
            for case let node in currentLevel {
                nextLevel.append(node.left)
                nextLevel.append(node.right)
            }
            
        } while nextLevel.count > 0
        
        return result
    }
}
