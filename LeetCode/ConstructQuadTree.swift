//
//  ConstructQuadTree.swift
//  https://leetcode.com/problems/construct-quad-tree/
//
//  Created by Erik Radicheski da Silva on 27/02/23.
//

import XCTest

final class ConstructQuadTree: XCTestCase {

    // TODO: Test cases

}

private typealias Node = GenericNode<Bool>

extension Node {
    convenience init(_ val: Bool, _ isLeaf: Bool) {
        self.init(val)
        self.isLeaf = isLeaf
    }
}

private class Solution {
    func construct(_ grid: [[Int]]) -> Node? {
        return construct(grid, 0, 0, grid.count)
    }
    
    private func construct(_ grid: [[Int]], _ x: Int, _ y: Int, _ length: Int) -> Node {
        guard length > 1 else { return Node(grid[x][y] == 1, true) }
        
        
        
        let halfLength = length / 2
        
        let topLeft = construct(grid, x, y, halfLength)
        let topRight = construct(grid, x, y + halfLength, halfLength)
        let bottomLeft = construct(grid, x + halfLength, y, halfLength)
        let bottomRight = construct(grid, x + halfLength, y + halfLength, halfLength)
        
        if [topLeft, topRight, bottomLeft, bottomRight].allSatisfy( { $0.isLeaf && $0.val == topLeft.val }) {
            return Node(topLeft.val, true)
        }
        
        let node = Node(false, false)
        
        node.topLeft = topLeft
        node.topRight = topRight
        node.bottomLeft = bottomLeft
        node.bottomRight = bottomRight
        
        return node
    }
}
