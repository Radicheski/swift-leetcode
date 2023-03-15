//
//  CheckCompletenessOfABinaryTree.swift
//  https://leetcode.com/problems/check-completeness-of-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 15/03/23.
//

import XCTest

final class CheckCompletenessOfABinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [1, 2, 3, 4, 5, 6])
        XCTAssertTrue(solution.isCompleteTree(input))
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [1, 2, 3, 4, 5, nil, 7])
        XCTAssertFalse(solution.isCompleteTree(input))
    }

}

private class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var queue =  [root]
        
        var level = 0
        
        while queue.isEmpty == false {
            for _ in 0 ..< (2 << level) {
                guard let node = queue.removeFirst() else {
                    return queue.allSatisfy { $0 == nil }
                }
                
                queue.append(node.left)
                queue.append(node.right)
            }
            
            level += 1
        }
        
        return true
    }
}
