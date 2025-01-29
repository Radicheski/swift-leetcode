//
//  RedundantConnection.swift
//  https://leetcode.com/problems/redundant-connection/
//
//  Created by Erik Radicheski da Silva on 29/01/25.
//

import XCTest

final class RedundantConnection: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findRedundantConnection([[1, 2], [1, 3], [2, 3]]), [2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]), [1, 4])
    }
    
}

private class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var cycleStart: Int?
        var visited = Set<Int>()
        var parent: [Int?] = Array(repeating: nil, count: edges.count)
        var adjList = [Int: [Int]]()
        
        for edge in edges {
            adjList[edge[0] - 1, default: []].append(edge[1] - 1)
            adjList[edge[1] - 1, default: []].append(edge[0] - 1)
        }
        
        depthFirst(0, &visited, adjList, &parent, &cycleStart)
        
        var cycleNodes = [Int: Int]()
        var node = cycleStart!
        
        repeat {
            cycleNodes[node] = 1
            node = parent[node]!
        } while (node != cycleStart)
        
        for edge in edges.reversed() {
            if let _ = cycleNodes[edge[0] - 1], let _ = cycleNodes[edge[1] - 1] {
                return edge
            }
        }
        
        return []
    }
    
    private func depthFirst(_ node: Int, _ visited: inout Set<Int>,  _ adjList: [Int: [Int]],
                            _ parent: inout [Int?], _ cycleStart: inout Int?) {
        visited.insert(node)
        
        for adj in adjList[node] ?? [] {
            if visited.contains(adj) == false {
                parent[adj] = node
                depthFirst(adj, &visited, adjList, &parent, &cycleStart)
            } else if adj != parent[node] && cycleStart == nil {
                cycleStart = adj
                parent[adj] = node
            }
        }
    }
}
