//
//  SumOfLeftLeaves.swift
//  https://leetcode.com/problems/sum-of-left-leaves/
//
//  Created by Erik Radicheski da Silva on 29/12/22.
//

import XCTest

final class SumOfLeftLeaves: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = TreeNode.parseTree(from: [3, 9, 20, nil, nil, 15, 7])
        XCTAssertEqual(solution.sumOfLeftLeaves(input), 24)
    }
    
    func testExampleB() {
        let input = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.sumOfLeftLeaves(input), 0)
    }

}

private class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        var sum = 0
        
        if let left = root?.left,
           left.left == nil && left.right == nil {
            sum += left.val
        } else {
            sum += sumOfLeftLeaves(root?.left)
        }
        
        sum += sumOfLeftLeaves(root?.right)
        
        return sum
    }
    
}
