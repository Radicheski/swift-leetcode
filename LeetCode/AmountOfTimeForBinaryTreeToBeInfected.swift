//
//  AmountOfTimeForBinaryTreeToBeInfected.swift
//  https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/
//
//  Created by Erik Radicheski da Silva on 10/01/24.
//

import XCTest

final class AmountOfTimeForBinaryTreeToBeInfected: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [1, 5, 3, nil, 4, 10, 6, 9, 2])
        XCTAssertEqual(solution.amountOfTime(root, 3), 4)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1])
        XCTAssertEqual(solution.amountOfTime(root, 1), 0)
    }
    
}

private class Solution {
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else { return .min }
        
        var nodes = [Int: [Int]]()
        var queue = [root]
        
        while queue.isEmpty == false {
            let node = queue.removeLast()
            
            if let left = node.left {
                nodes[node.val, default: []].append(left.val)
                nodes[left.val, default: []].append(node.val)
                
                queue.append(left)
            }
            
            if let right = node.right {
                nodes[node.val, default: []].append(right.val)
                nodes[right.val, default: []].append(node.val)
                
                queue.append(right)
            }
        }
        
        guard nodes.count > 1 else{ return 0 }
        
        var infected = Set([start])
        var time = -1
        
        while nodes.isEmpty == false {
            var newlyInfected = Set<Int>()
            
            for node in infected {
                for neighbor in nodes[node, default: []] {
                    newlyInfected.insert(neighbor)
                }
                
                nodes[node] = nil
            }
            
            infected = newlyInfected
            
            time += 1
        }
        
        return time
    }
}
