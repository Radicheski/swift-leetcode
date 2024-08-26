//
//  NaryTreePostorderTraversal.swift
//  https://leetcode.com/problems/n-ary-tree-postorder-traversal/
//
//  Created by Erik Radicheski da Silva on 26/08/24.
//

import XCTest

private typealias Node = GenericNode<Int>

final class NaryTreePostorderTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = GenericNode<Int>.parseTree(from: [1, nil, 3, 2, 4, nil, 5, 6])
        XCTAssertEqual(solution.postorder(root), [5, 6, 3, 2, 4, 1])
    }
    
    func testExampleB() {
        let root = GenericNode<Int>.parseTree(from: [1, nil, 2, 3, 4, 5, nil, nil, 6, 7, nil, 8, nil, 9, 10, nil, nil, 11, nil, 12, nil, 13, nil, nil, 14])
        XCTAssertEqual(solution.postorder(root), [2, 6, 14, 11, 7, 3, 12, 8, 4, 13, 9, 10, 5, 1])
    }

}

private class Solution {
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        return root.children.flatMap(postorder) + [root.val]
    }
}
