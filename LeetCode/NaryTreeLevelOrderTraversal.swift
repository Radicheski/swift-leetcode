//
//  NaryTreeLevelOrderTraversal.swift
//  https://leetcode.com/problems/n-ary-tree-level-order-traversal/
//
//  Created by Erik Radicheski da Silva on 09/01/23.
//

import XCTest

final class NaryTreeLevelOrderTraversal: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let node = Node.parseTree(from: [1, nil, 3, 2, 4, nil, 5, 6])
        XCTAssertEqual(solution.levelOrder(node), [[1], [3, 2, 4], [5, 6]])
    }
    
    func testExampleB() {
        let node = Node.parseTree(from: [1, nil, 2, 3, 4, 5, nil, nil, 6, 7, nil, 8, nil, 9, 10,
                                         nil, nil, 11, nil, 12, nil, 13, nil, nil, 14])
        XCTAssertEqual(solution.levelOrder(node), [[1], [2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13], [14]])
    }

}

private class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result = [[Int]]()
        
        var children = [root]
        
        while children.isEmpty == false {
            var nextChildren = [Node]()
            var currentValues = [Int]()
            
            for child in children {
                currentValues.append(child.val)
                child.children.compactMap( { $0 } ).forEach( { nextChildren.append($0) } )
            }
            
            result.append(currentValues)
            children = nextChildren
        }
        
        return result
    }
}
