//
//  ConstructStringFromBinaryTree.swift
//  https://leetcode.com/problems/construct-string-from-binary-tree/
//
//  Created by Erik Radicheski da Silva on 08/12/23.
//

import XCTest

final class ConstructStringFromBinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 2, 3, 4])
        XCTAssertEqual(solution.tree2str(root), "1(2(4))(3)")
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3, nil, 4])
        XCTAssertEqual(solution.tree2str(root), "1(2()(4))(3)")
    }

}

private class Solution {
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        
        if let _ = root.right {
            return "\(root.val)(\(tree2str(root.left)))(\(tree2str(root.right)))"
        } else if let _ = root.left {
            return "\(root.val)(\(tree2str(root.left)))"
        } else {
            return "\(root.val)"
        }
    }
}
