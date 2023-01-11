//
//  MinimumTimeToCollectAllApplesInATree.swift
//  https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/
//
//  Created by Erik Radicheski da Silva on 11/01/23.
//

import XCTest

final class MinimumTimeToCollectAllApplesInATree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minTime(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]],
                                        [false, false, true, false, true, true, false]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minTime(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]],
                                        [false ,false, true, false, false, true, false]), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minTime(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]],
                                        [false ,false, false, false, false, false, false]), 0)
    }

}

private class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var adj = [Int: [Int]]()
        for edge in edges {
            let (edgeA, edgeB) = (edge[0], edge[1])
            adj[edgeA, default: []].append(edgeB)
            adj[edgeB, default: []].append(edgeA)
        }
        
        return depthFirst(0, -1, &adj, hasApple)
    }
    
    private func depthFirst(_ node: Int, _ parent: Int, _ adj: inout [Int: [Int]], _ hasApple: [Bool]) -> Int {
        guard let children = adj[node] else { return 0 }
        
        var totalTime = 0
        var childTime = 0
        
        for child in children {
            guard child != parent else { continue }
            
            childTime = depthFirst(child, node, &adj, hasApple)
            
            if childTime > 0 || hasApple[child] {
                totalTime += childTime + 2
            }
        }
        
        return totalTime
    }
    
}
