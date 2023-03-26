//
//  LongestCycleInAGraph.swift
//  https://leetcode.com/problems/longest-cycle-in-a-graph/
//
//  Created by Erik Radicheski da Silva on 26/03/23.
//

import XCTest

final class LongestCycleInAGraph: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestCycle([3, 3, 4, 2, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestCycle([2, -1, 3, 1]), -1)
    }

}

private class Solution {
    func longestCycle(_ edges: [Int]) -> Int {
        var answer = -1
        
        var visited = Array(repeating: false, count: edges.count)

        
        for i in edges.indices {
            if visited[i] == false {
                var dist = [i: 1]
                depthFirst(i, edges, &dist, &visited, &answer)
            }
        }
        
        return answer
    }
    
    private func depthFirst(_ node: Int,
                            _ edges: [Int],
                            _ dist: inout [Int: Int],
                            _ visited: inout [Bool],
                            _ answer: inout Int) {
        visited[node] = true
        var neighbor = edges[node]
        
        if neighbor != -1 && visited[neighbor] == false {
            dist[neighbor] = dist[node, default: 0] + 1
            depthFirst(neighbor, edges, &dist, &visited, &answer)
        } else if neighbor != -1 && dist[neighbor] != nil {
            answer = max(answer, dist[node]! - dist[neighbor]! + 1)
        }
    }
}
