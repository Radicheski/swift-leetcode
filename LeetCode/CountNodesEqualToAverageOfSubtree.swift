//
//  CountNodesEqualToAverageOfSubtree.swift
//  https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/
//
//  Created by Erik Radicheski da Silva on 02/11/23.
//

import XCTest

final class CountNodesEqualToAverageOfSubtree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [4, 8, 5, 0, 1, nil, 6])
        XCTAssertEqual(solution.averageOfSubtree(root), 5)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.averageOfSubtree(root), 1)
    }

}

private class Solution {
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var answer = 0
        let _ = subtree(root, &answer)
        return answer
    }
    
    private func subtree(_ root: TreeNode?, _ answer: inout Int) -> (sum: Int, nodes: Int) {
        guard let root = root else { return (0, 0) }
        
        var sum = root.val
        var nodes = 1
        
        let (leftSum, leftNodes) = subtree(root.left, &answer)
        sum += leftSum
        nodes += leftNodes
        
        let (rightSum, rightNodes) = subtree(root.right, &answer)
        sum += rightSum
        nodes += rightNodes
        
        if root.val == sum / nodes {
            answer += 1
        }
        
        return (sum, nodes)
    }
}
