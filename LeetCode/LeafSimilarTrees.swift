//
//  LeafSimilarTrees.swift
//  https://leetcode.com/problems/leaf-similar-trees/
//
//  Created by Erik Radicheski da Silva on 09/01/24.
//

import XCTest

final class LeafSimilarTrees: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root1 = TreeNode.parseTree(from: [3, 5, 1, 6, 2, 9, 8, nil, nil, 7, 4])
        let root2 = TreeNode.parseTree(from: [3, 5, 1, 6, 7, 4, 2, nil, nil, nil, nil, nil, nil, 9, 8])
        XCTAssertTrue(solution.leafSimilar(root1, root2))
    }
    
    func testExampleB() {
        let root1 = TreeNode.parseTree(from: [1, 2, 3])
        let root2 = TreeNode.parseTree(from: [1, 3, 2])
        XCTAssertFalse(solution.leafSimilar(root1, root2))
    }
    
}

private class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return tree(root1) == tree(root2)
    }
    
    private func tree(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var answer = [Int]()
        var queue = [root]
        
        while queue.isEmpty == false {
            let node = queue.removeLast()
            
            if node.left == nil && node.right == nil {
                answer.append(node.val)
                continue
            }
            
            if let right = node.right {
                queue.append(right)
            }
            
            if let left = node.left {
                queue.append(left)
            }
        }
        
        return answer
    }
}
