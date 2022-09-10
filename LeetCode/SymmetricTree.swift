//
//  SymmetricTree.swift
//  https://leetcode.com/problems/symmetric-tree/
//
//  Created by Erik Radicheski da Silva on 10/09/22.
//

import XCTest

class SymmetricTree: XCTestCase {

    func test() {
        
    }

}

private class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    private func isMirror(_ rootA: TreeNode?, _ rootB: TreeNode?) -> Bool {
        if rootA == nil && rootB == nil { return true }
        guard let rootA = rootA, let rootB = rootB else { return false }
        
        if rootA.val != rootB.val {
            return false
        } else {
            return isMirror(rootA.left, rootB.right) && isMirror(rootA.right, rootB.left)
        }
    }
}
