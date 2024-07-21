//
//  BuildAMatrixWithConditions.swift
//  https://leetcode.com/problems/build-a-matrix-with-conditions/
//
//  Created by Erik Radicheski da Silva on 21/07/24.
//

import XCTest

final class BuildAMatrixWithConditions: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.buildMatrix(3, [[1, 2], [3, 2]], [[2, 1], [3, 2]]), [[3, 0, 0], [0, 0, 1], [0, 2, 0]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.buildMatrix(3, [[1, 2], [2, 3], [3, 1], [2, 3]], [[2, 1]]), [])
    }
    
}

private class Solution {
    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        let orderRows = topologicalSort(rowConditions, k)
        let orderCols = topologicalSort(colConditions, k)
        
        if orderRows.isEmpty || orderCols.isEmpty { return [] }
        
        var matrix = Array(repeating: Array(repeating: 0, count: k), count: k)
        
        for i in 0 ..< k {
            for j in 0 ..< k where orderRows[i] == orderCols[j] {
                matrix[i][j] = orderRows[i]
            }
        }
        
        return matrix
    }
    
    private func topologicalSort(_ edges: [[Int]], _ k: Int) -> [Int] {
        var adj = [Int: [Int]]()
        var order = [Int]()
        var visited = Array(repeating: 0, count: k + 1)
        var hasCycle = false
        
        for edge in edges {
            adj[edge[0], default: []].append(edge[1])
        }
        
        for node in 1 ... k where visited[node] == 0 {
            depthFirst(node, adj, &visited, &order, &hasCycle)
            
            if hasCycle { return [] }
        }
        
        return order.reversed()
    }
    
    private func depthFirst(_ node: Int, _ adj: [Int: [Int]], _ visited: inout [Int],
                            _ order: inout [Int], _ hasCycle: inout Bool) {
        visited[node] = 1
        
        for neighbor in adj[node] ?? [] {
            if visited[neighbor] == 1 {
                hasCycle = true
                return
            } else if visited[neighbor] == 0 {
                depthFirst(neighbor, adj, &visited, &order, &hasCycle)
                if hasCycle { return }
            }
        }
        
        visited[node] = 2
        
        order.append(node)
    }
}
