//
//  MinimumDistanceBetweenBSTNodes.swift
//  https://leetcode.com/problems/minimum-distance-between-bst-nodes/
//
//  Created by Erik Radicheski da Silva on 17/02/23.
//

import XCTest

final class MinimumDistanceBetweenBSTNodes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let treeNode = TreeNode.parseTree(from: [4, 2, 6, 1, 3])
        XCTAssertEqual(solution.minDiffInBST(treeNode), 1)
    }
    
    func testExampleB() {
        let treeNode = TreeNode.parseTree(from: [1, 0, 48, nil, nil, 12, 49])
        XCTAssertEqual(solution.minDiffInBST(treeNode), 1)
    }

}

private class Solution {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard let root = root else { return .max }
        
        var queue = [root]
        var values = [Int]()
        
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            
            values.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        values.sort()
        
        var distance = Int.max
        
        for i in 0 ..< values.endIndex - 1 {
            distance = min(distance, abs(values[i] - values[i + 1]))
        }
        
        return distance
    }
}
