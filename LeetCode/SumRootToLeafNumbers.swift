//
//  SumRootToLeafNumbers.swift
//  https://leetcode.com/problems/sum-root-to-leaf-numbers/
//
//  Created by Erik Radicheski da Silva on 14/03/23.
//

import XCTest

final class SumRootToLeafNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 2, 3])
        XCTAssertEqual(solution.sumNumbers(root), 25)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [4, 9, 0, 5, 1])
        XCTAssertEqual(solution.sumNumbers(root), 1026)
    }

}

private class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [(preffix: [root.val], node: root)]
        
        var sum = 0
        
        while queue.isEmpty == false {
            let (preffix, node) = queue.removeFirst()
            
            if node.left == nil && node.right == nil {
                
                let path = preffix.reduce(into: 0) { $0 = ($0 * 10) + $1 }
                sum += path
                
                continue
            }
            
            if let left = node.left {
                let nextPreffix = preffix + [left.val]
                queue.append((nextPreffix, left))
            }
            
            if let right = node.right {
                let nextPreffix = preffix + [right.val]
                queue.append((nextPreffix, right))
            }
        }
        
        return sum
    }
}
