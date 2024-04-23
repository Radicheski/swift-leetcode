//
//  MinimumHeightTrees.swift
//  https://leetcode.com/problems/minimum-height-trees/
//
//  Created by Erik Radicheski da Silva on 23/04/24.
//

import XCTest

final class MinimumHeightTrees: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMinHeightTrees(4, [[1, 0], [1, 2], [1, 3]]), [1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMinHeightTrees(6, [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]]), [3, 4])
    }
    
}

private class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        
        var count = n
        var neighbors = Array(repeating: [Int](), count: n)
        var levels = Array(repeating: 0, count: n)
        
        for edge in edges {
            neighbors[edge[0]].append(edge[1])
            neighbors[edge[1]].append(edge[0])
            
            levels[edge[0]] += 1
            levels[edge[1]] += 1
        }
        
        var queue = levels.enumerated().filter { $0.element == 1 }.map(\.offset)
        
        while count > 2 {
            count -= queue.count
            
            var newQueue = [Int]()
            
            while let node = queue.popLast() {
                
                for neighbor in neighbors[node] {
                    levels[neighbor] -= 1
                    
                    if levels[neighbor] == 1 {
                        newQueue.append(neighbor)
                    }
                }
            }
            
            queue.append(contentsOf: newQueue)
        }
        
        return queue
    }
}
