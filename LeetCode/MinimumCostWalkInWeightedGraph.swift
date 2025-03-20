//
//  MinimumCostWalkInWeightedGraph.swift
//  https://leetcode.com/problems/minimum-cost-walk-in-weighted-graph/
//
//  Created by Erik Radicheski da Silva on 20/03/25.
//

import XCTest

final class MinimumCostWalkInWeightedGraph: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumCost(5, [[0, 1, 7], [1, 3, 7], [1, 2, 1]], [[0,3],[3,4]]), [1, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumCost(3, [[0, 2, 7], [0, 1, 15], [1, 2, 6], [1, 2, 1]], [[1,2]]), [0])
    }
    
}

private class Solution {
    func minimumCost(_ n: Int, _ edges: [[Int]], _ query: [[Int]]) -> [Int] {
        var graph = [Int: [(vertex: Int, cost: Int)]]()
        var notVisited = Array(repeating: true, count: n)
        var components: [Int?] = Array(repeating: nil, count: n)
        var componentCost = Array(repeating: Int.max, count: n)
        var component = 0
        
        for edge in edges {
            graph[edge[0], default: []].append((edge[1], edge[2]))
            graph[edge[1], default: []].append((edge[0], edge[2]))
        }
        
        for i in 0 ..< n {
            var queue = [i]
            
            while let node = queue.popLast() {
                guard notVisited[node] else { continue }
                notVisited[node] = false
                
                components[node] = component
                
                for (vertex, cost) in graph[node, default: []] {
                    queue.append(vertex)
                    componentCost[component] &= cost
                }
            }
            
            component += 1
        }
        
        return query.map { q in
            if let c = components[q[0]], c == components[q[1]] {
                componentCost[c]
            } else {
                -1
            }
        }
    }
}
