//
//  NaryTreePreorderTraversal.swift
//  https://leetcode.com/problems/n-ary-tree-preorder-traversal/
//
//  Created by Erik Radicheski da Silva on 21/08/22.
//

import XCTest

class NaryTreePreorderTraversal: XCTestCase {

    func test() {
        /*
         Input: root = [1,null,3,2,4,null,5,6]
         Output: [1,3,5,6,2,4]
         
         Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
         Output: [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
         */
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
