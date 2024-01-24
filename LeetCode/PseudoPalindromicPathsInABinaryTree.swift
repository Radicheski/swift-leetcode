//
//  PseudoPalindromicPathsInABinaryTree.swift
//  https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
//
//  Created by Erik Radicheski da Silva on 24/01/24.
//

import XCTest

final class PseudoPalindromicPathsInABinaryTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [2, 3, 1, 3, 1, nil, 1])
        XCTAssertEqual(solution.pseudoPalindromicPaths(root), 2)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [2, 1, 1, 1, 3, nil, nil, nil, nil, nil, 1])
        XCTAssertEqual(solution.pseudoPalindromicPaths(root), 1)
    }
    
    func testExampleC() {
        let root = TreeNode.parseTree(from: [9])
        XCTAssertEqual(solution.pseudoPalindromicPaths(root), 1)
    }

}

private class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else { return .min }
        
        var answer = 0
        
        paths(root, 0, &answer)
        
        return answer
    }
    
    
    private func paths(_ root: TreeNode?, _ count: Int, _ sum: inout Int) {
        guard let root =  root else { return }
        
        let count = count ^ (1 << root.val)
        
        paths(root.left, count, &sum)
        paths(root.right, count, &sum)
        
        if root.left == nil && root.right == nil {
            if count.nonzeroBitCount < 2 {
                sum += 1
            }
        }
    }
}
