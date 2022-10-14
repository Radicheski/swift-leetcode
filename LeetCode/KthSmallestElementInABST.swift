//
//  KthSmallestElementInABST.swift
//  https://leetcode.com/problems/kth-smallest-element-in-a-bst/
//
//  Created by Erik Radicheski da Silva on 14/10/22.
//

import XCTest

final class KthSmallestElementInABST: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 1, 4, nil, 2])
        XCTAssertEqual(solution.kthSmallest(root, 1), 1)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [5, 3, 6, 2, 4, nil, nil, 1])
        XCTAssertEqual(solution.kthSmallest(root, 3), 3)
    }

}

private class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return inorder(root)[k - 1]
    }
    
    private func inorder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        let left = inorder(root.left)
        let right = inorder(root.right)
        
        var result = [Int]()
        result.append(contentsOf: left)
        result.append(root.val)
        result.append(contentsOf: right)
        
        return result
    }
}
