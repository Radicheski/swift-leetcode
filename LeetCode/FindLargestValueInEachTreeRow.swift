//
//  FindLargestValueInEachTreeRow.swift
//  https://leetcode.com/problems/find-largest-value-in-each-tree-row/
//
//  Created by Erik Radicheski da Silva on 24/10/23.
//

import XCTest

final class FindLargestValueInEachTreeRow: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 3, 2, 5, 3, nil, 9])
        XCTAssertEqual(solution.largestValues(root), [1, 3, 9])
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1, 2, 3])
        XCTAssertEqual(solution.largestValues(root), [1, 3])
    }

}

private class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var queue = [(level: 0, node: root)]
        var answer = [Int]()
        
        while queue.isEmpty == false {
            let (level, node) = queue.removeFirst()
            
            while answer.indices.contains(level) == false {
                answer.append(.min)
            }
            
            if node.val > answer[level] {
                answer[level] = node.val
            }
            
            if let left = node.left {
                queue.append((level + 1, left))
            }
            
            if let right = node.right {
                queue.append((level + 1, right))
            }
            
        }
        
        return answer
    }
}
