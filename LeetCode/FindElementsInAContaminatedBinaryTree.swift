//
//  FindElementsInAContaminatedBinaryTree.swift
//  https://leetcode.com/problems/find-elements-in-a-contaminated-binary-tree/
//
//  Created by Erik Radicheski da Silva on 21/02/25.
//

import XCTest

final class FindElementsInAContaminatedBinaryTree: XCTestCase {
}

private class FindElements {
    
    private let elements: Set<Int>
    
    init(_ root: TreeNode?) {
        root?.val = 0
        var queue = [root!]
        var elements = Set<Int>()
        
        while let node = queue.popLast() {
            elements.insert(node.val)
            
            if let left = node.left {
                left.val = 2 * node.val + 1
                queue.append(left)
            }
            
            if let right = node.right {
                right.val = 2 * node.val + 2
                queue.append(right)
            }
        }
        
        self.elements = elements
    }
    
    func find(_ target: Int) -> Bool {
        return elements.contains(target)
    }
}
