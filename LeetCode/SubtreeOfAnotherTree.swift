//
//  SubtreeOfAnotherTree.swift
//  https://leetcode.com/problems/subtree-of-another-tree/
//
//  Created by Erik Radicheski da Silva on 25/10/22.
//

import XCTest

final class SubtreeOfAnotherTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 4, 5, 1, 2])
        let subRoot = TreeNode.parseTree(from: [4, 1, 2])
        XCTAssertTrue(solution.isSubtree(root, subRoot))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [3, 4, 5, 1, 2, nil, nil, nil, nil, 0])
        let subRoot = TreeNode.parseTree(from: [4, 1, 2])
        XCTAssertFalse(solution.isSubtree(root, subRoot))
    }

}

private class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var nodes = [root]
        
        while nodes.isEmpty == false {
            let node = nodes.removeFirst()
            
            if isEqual(node, subRoot) { return true }
            
            if node == nil { continue }
            
            nodes.append(node?.left)
            nodes.append(node?.right)
        }
        
        return false
    }
    
    private func isEqual(_ treeA: TreeNode?, _ treeB: TreeNode?) -> Bool {
        guard let treeA = treeA, let treeB = treeB else { return treeA == nil && treeB == nil }
        return treeA.val == treeB.val && isEqual(treeA.left, treeB.left) && isEqual(treeA.right, treeB.right)
    }
}
