//
//  ModifyGraphEdgeWeights.swift
//  https://leetcode.com/problems/modify-graph-edge-weights/
//
//  Created by Erik Radicheski da Silva on 30/08/24.
//

import XCTest

final class ModifyGraphEdgeWeights: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.modifiedGraphEdges(5, [[4, 1, -1], [2, 0, -1], [0, 3, -1], [4, 3, -1]], 0, 1, 5), [[4, 1, 1], [2, 0, 1], [0, 3, 3], [4, 3, 1]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.modifiedGraphEdges(3, [[0, 1, -1], [0, 2, 5]], 0, 2, 6), [])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.modifiedGraphEdges(4, [[1, 0, 4], [1, 2, 3], [2, 3, 5], [0, 3, -1]], 0, 2, 6), [[1, 0, 4], [1, 2, 3], [2, 3, 5], [0, 3, 1]])
    }
    
}

private class Solution {
    
    private let inf = 2_000_000_000
    
    func modifiedGraphEdges(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int, _ target: Int) -> [[Int]] {
        var edges = edges
        
        var currentShortestDistance = runDijkstra(edges, n, source, destination)
        
        if currentShortestDistance < target { return [] }
        
        var matchesTarget = currentShortestDistance == target
        
        for i in edges.indices {
            if edges[i][2] > 0 { continue }
            
            edges[i][2] = matchesTarget ? inf : 1
            
            if matchesTarget == false {
                var newDistance = runDijkstra(edges, n, source, destination)
                
                if newDistance <= target {
                    matchesTarget = true
                    edges[i][2] += target - newDistance
                }
            }
        }
        
        return matchesTarget ? edges : []
    }
    
    private func runDijkstra(_ edges: [[Int]], _ n: Int, _ source: Int, _ destination: Int) -> Int {
        var adjMatrix = Array(repeating: Array(repeating: inf, count: n), count: n)
        var minDistance = Array(repeating: inf, count: n)
        var visited = Array(repeating: false, count: n)
        
        minDistance[source] = 0
        
        for edge in edges {
            if edge[2] != -1 {
                adjMatrix[edge[0]][edge[1]] = edge[2]
                adjMatrix[edge[1]][edge[0]] = edge[2]
            }
        }
        
        for i in 0 ..< n {
            var nearestUnvisitedNode = -1
            for j in 0 ..< n {
                if (
                    visited[j] == false &&
                    (nearestUnvisitedNode == -1 ||
                     minDistance[j] < minDistance[nearestUnvisitedNode])
                ) {
                    nearestUnvisitedNode = j
                }
            }
            visited[nearestUnvisitedNode] = true
            
            for v in 0 ..< n {
                minDistance[v] = min(
                    minDistance[v],
                    minDistance[nearestUnvisitedNode] +
                    adjMatrix[nearestUnvisitedNode][v]
                );
            }
        }
        
        return minDistance[destination]
    }
}
