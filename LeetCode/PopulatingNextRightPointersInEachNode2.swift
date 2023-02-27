//
//  PopulatingNextRightPointersInEachNode2.swift
//  https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
//
//  Created by Erik Radicheski da Silva on 25/10/22.
//

import XCTest

final class PopulatingNextRightPointersInEachNode2: XCTestCase {
    //TODO: Test cases
}

private typealias Node = GenericNode<Int>

private class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        var currentLevel = [root]
        var nextLevel = [Node]()
        
        while currentLevel.isEmpty == false {
            for (index, node) in currentLevel.enumerated() {
                if let left = node.left {
                    nextLevel.append(left)
                }
                
                if let right = node.right {
                    nextLevel.append(right)
                }
                
                if index + 1 < currentLevel.endIndex {
                    node.next = currentLevel[index + 1]
                }
            }
            
            currentLevel = nextLevel
            nextLevel.removeAll(keepingCapacity: true)
        }
        
        return root
    }
}
