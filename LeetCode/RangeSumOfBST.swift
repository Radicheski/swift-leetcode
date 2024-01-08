//
//  RangeSumOfBST.swift
//  https://leetcode.com/problems/range-sum-of-bst/
//
//  Created by Erik Radicheski da Silva on 08/01/24.
//

import XCTest

final class RangeSumOfBST: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [10, 5, 15, 3, 7, nil, 18])
        XCTAssertEqual(solution.rangeSumBST(root, 7, 15), 32)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [10, 5, 15, 3, 7, 13, 18, 1, nil, 6])
        XCTAssertEqual(solution.rangeSumBST(root, 6, 10), 23)
    }
    
}

private class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [root]
        var answer = 0
        let range = low ... high
        
        while queue.isEmpty == false {
            let node = queue.removeLast()
            
            if range.contains(node.val) {
                answer += node.val
            }
            
            if node.val > low, let left = node.left {
                queue.append(left)
            }
            
            if node.val < high, let right = node.right {
                queue.append(right)
            }
        }
        
        return answer
    }
}
