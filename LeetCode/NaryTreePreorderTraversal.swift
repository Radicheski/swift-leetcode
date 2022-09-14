//
//  NaryTreePreorderTraversal.swift
//  https://leetcode.com/problems/n-ary-tree-preorder-traversal/
//
//  Created by Erik Radicheski da Silva on 21/08/22.
//

import XCTest

class NaryTreePreorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = Node.parseTree(from: [1, nil, 3, 2, 4, nil, 5, 6])
        XCTAssertEqual(solution.preorder(root), [1, 3, 5, 6, 2, 4])
    }
    
    func testExampleB() {
        let root = Node.parseTree(from: [1, nil, 2, 3, 4, 5, nil, nil, 6, 7, nil, 8, nil, 9, 10, nil, nil, 11, nil, 12, nil, 13, nil, nil, 14])
        XCTAssertEqual(solution.preorder(root), [1, 2, 3, 6, 7, 11, 14, 4, 8, 12, 5, 9, 13, 10])
    }

}

private class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var result = [root.val]
        root.children.flatMap { preorder($0) }.forEach { result.append($0) }
        return result
    }
}
