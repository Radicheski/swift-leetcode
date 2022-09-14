//
//  TwoSum4.swift
//  https://leetcode.com/problems/two-sum-iv-input-is-a-bst/
//
//  Created by Erik Radicheski da Silva on 13/09/22.
//

import XCTest

class TwoSum4: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let root = TreeNode.parseTree(from: [5, 3, 6, 2, 4, nil, 7])
        XCTAssertTrue(solution.findTarget(root, 9))
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [5, 3, 6, 2, 4, nil, 7])
        XCTAssertFalse(solution.findTarget(root, 28))
    }

}

private class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        
        let values = inorder(root)
        
        for (index, value) in values.enumerated() {
            if binarySearch(Array(values[index+1..<values.count]), k - value) { return true }
        }
        
        return false
    }
    
    private func inorder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        let left = inorder(root.left)
        let right = inorder(root.right)
        
        var result = left
        result.append(root.val)
        result.append(contentsOf: right)
        
        return result

    }
    
    private func binarySearch(_ list: [Int], _ value: Int) -> Bool {
        if list.isEmpty { return false }
        
        let middleIndex = list.count / 2
        
        if list[middleIndex] == value { return true }
        else if list[middleIndex] > value { return binarySearch(Array(list[0..<middleIndex]), value) }
        else { return binarySearch(Array(list[middleIndex + 1 ..< list.count]), value)}
    }
                 
}
