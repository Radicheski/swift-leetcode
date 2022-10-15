//
//  LowestCommonAncestorOfABinaryTree.swift
//  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 15/10/22.
//

import XCTest

final class LowestCommonAncestorOfABinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
        let output = solution.lowestCommonAncestor(root, root?.left, root?.right)
        XCTAssertTrue(TreeNode.isEqual(root, output))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
        let output = solution.lowestCommonAncestor(root, root?.left, root?.left?.right?.right)
        XCTAssertTrue(TreeNode.isEqual(root?.left, output))
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [1, 2])
        let output = solution.lowestCommonAncestor(root, root, root?.left)
        XCTAssertTrue(TreeNode.isEqual(root, output))
    }

}

private class Solution {
    
    private enum State: Int {
        case bothDone = 0, leftDone, pending
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        guard let nodeP = p else { return nil }
        guard let nodeQ = q else { return nil }
        
        var queue = [(node: TreeNode, state: State)]()
        
        queue.append((root, .pending))
        
        var hasFoundAny = false
        
        var commonAncestor: TreeNode? = nil
        
        var node: TreeNode? = nil
        
        while queue.isEmpty == false {
            let lastNode = queue.last!
            let currentNode = lastNode.node
            let currentState = lastNode.state
            
            if currentState != .bothDone {
                if currentState == .pending {
                    if currentNode.val == nodeP.val || currentNode.val == nodeQ.val {
                        if hasFoundAny { return commonAncestor }
                        
                        hasFoundAny = true;
                        commonAncestor = currentNode
                    }
                    node = currentNode.left
                } else {
                    node = currentNode.right
                }
                
                queue.removeLast()
                queue.append((currentNode, State(rawValue: currentState.rawValue
                                                 - 1)!))
                
                if let node = node {
                    queue.append((node, .pending))
                }
            } else {
                if commonAncestor?.val == queue.removeLast().node.val && hasFoundAny {
                    commonAncestor = queue.last?.node
                }
            }
        }
        
        return nil
    }
}
