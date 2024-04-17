//
//  SmallestStringStartingFromLeaf.swift
//  https://leetcode.com/problems/smallest-string-starting-from-leaf/
//
//  Created by Erik Radicheski da Silva on 17/04/24.
//

import XCTest

final class SmallestStringStartingFromLeaf: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestFromLeaf(TreeNode.parseTree(from: [0, 1, 2, 3, 4, 3, 4])), "dba")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestFromLeaf(TreeNode.parseTree(from: [25, 1, 3, 1, 3, 0, 2])), "adz")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.smallestFromLeaf(TreeNode.parseTree(from: [2, 2, 1, nil, 1, 0, nil, 0])), "abc")
    }

}

private class Solution {
    private let characters = Array("abcdefghijklmnopqrstuvwxyz")
    
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var answer: String?
        
        var queue = [([Int](), root!)]
        
        while queue.isEmpty == false {
            let (previous, root) = queue.removeLast()
            
            let array = previous + [root.val]
            
            if root.left == nil && root.right == nil {
                let currentString = String(array.map { characters[$0] }.reversed())
                
                if answer == nil || currentString < answer! {
                    answer = currentString
                }
            } else {
                if let left = root.left {
                    queue.append((array, left))
                }
                
                if let right = root.right {
                    queue.append((array, right))
                }
            }
        }
        
        return answer!
    }
}
