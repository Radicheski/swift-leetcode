//
//  ShortestPathVisitingAllNodes.swift
//  https://leetcode.com/problems/shortest-path-visiting-all-nodes/
//
//  Created by Erik Radicheski da Silva on 30/01/23.
//

import XCTest

final class ShortestPathVisitingAllNodes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestPathLength([[1, 2, 3], [0], [0], [0]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestPathLength([[1], [0, 2, 4], [1, 3, 4], [2], [1, 2]]), 4)
    }

}

private class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: .max, count: 1 << graph.count), count: graph.count)
        
        var queue = [(mask: Int, source: Int)]()
        
        for i in 0 ..< graph.endIndex {
            dp[i][1 << i] = 0
            queue.append((1 << i, i))
        }
        
        while queue.isEmpty == false {
            let (mask, source) = queue.removeFirst()
            
            for next in graph[source] {
                let nextMask = mask | 1 << next
                if dp[next][nextMask] > dp[source][mask] + 1 {
                    dp[next][nextMask] = dp[source][mask] + 1
                    queue.append((nextMask, next))
                }
            }
        }
        
        var result = Int.max
        
        for i in 0 ..< graph.count {
            result = min(result, dp[i].last!)
        }
        
        return result
    }
}
