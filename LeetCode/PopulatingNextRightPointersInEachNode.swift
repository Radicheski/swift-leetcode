//
//  PopulatingNextRightPointersInEachNode.swift
//  https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
//
//  Created by Erik Radicheski da Silva on 21/09/22.
//

import XCTest

final class PopulatingNextRightPointersInEachNode: XCTestCase {
    // TODO: Create test cases from examples
}

private class Solution {
    
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        var queue = [root]
        
        while !queue.isEmpty {
            let count = queue.count - 1
            for index in 0 ... count {
                let node = queue.removeFirst()
                
                if index != count { node.next = queue.first }
                
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        
        return root
    }
    
}
