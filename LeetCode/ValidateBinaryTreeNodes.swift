//
//  ValidateBinaryTreeNodes.swift
//  https://leetcode.com/problems/validate-binary-tree-nodes/
//
//  Created by Erik Radicheski da Silva on 17/10/23.
//

import XCTest

final class ValidateBinaryTreeNodes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.validateBinaryTreeNodes(4, [1, -1, 3, -1], [2, -1, -1, -1]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.validateBinaryTreeNodes(4, [1, -1, 3, -1], [2, 3, -1, -1]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.validateBinaryTreeNodes(2, [1, 0], [-1, -1]))
    }

}

private class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        guard let root = findRoot(leftChild, rightChild) else { return false }
        var notVisited = Set(0 ..< n)
        
        var queue = [root]
        
        while let node = queue.popLast() {
            guard notVisited.contains(node) else { return false }
            notVisited.remove(node)
            
            if leftChild[node] != -1  {
                queue.append(leftChild[node])
            }
            
            if rightChild[node] != -1  {
                queue.append(rightChild[node])
            }
        }
        
        return notVisited.isEmpty
    }
    
    private func findRoot(_ leftChild: [Int], _ rightChild: [Int]) -> Int? {
        return Set(leftChild.indices).subtracting(leftChild + rightChild).first
    }
}
