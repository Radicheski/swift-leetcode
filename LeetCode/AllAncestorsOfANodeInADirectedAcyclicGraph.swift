//
//  AllAncestorsOfANodeInADirectedAcyclicGraph.swift
//  https://leetcode.com/problems/all-ancestors-of-a-node-in-a-directed-acyclic-graph/
//
//  Created by Erik Radicheski da Silva on 29/06/24.
//

import XCTest

final class AllAncestorsOfANodeInADirectedAcyclicGraph: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getAncestors(8, [[0, 3], [0, 4], [1, 3], [2, 4], [2, 7], [3, 5], [3, 6], [3, 7], [4, 6]]),
                       [[], [], [], [0, 1], [0, 2], [0, 1, 3],  [0, 1, 2, 3, 4], [0, 1, 2, 3]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getAncestors(5, [[0, 1], [0, 2], [0, 3], [0, 4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]),
                       [[], [0], [0, 1], [0, 1, 2], [0, 1, 2, 3]])
    }
    
}

private class Solution {
    func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var neighbors = Array(repeating: [Int](), count: n)
        var indegree = Array(repeating: 0, count: n)
        
        for edge in edges {
            neighbors[edge[0]].append(edge[1])
            indegree[edge[1]] += 1
        }
        
        var noIndegree = indegree.enumerated().filter { $0.element == 0 }.map(\.offset)
        
        var sorted = [Int]()
        while noIndegree.isEmpty == false {
            let node = noIndegree.removeFirst()
            sorted.append(node)
            
            for neighbor in neighbors[node] {
                indegree[neighbor] -= 1
                if indegree[neighbor] == 0 {
                    noIndegree.append(neighbor)
                }
            }
        }
        
        var ancestors = Array(repeating: Set<Int>(), count: n)
        
        for node in sorted {
            for neighbor in neighbors[node] {
                ancestors[neighbor].insert(node)
                ancestors[neighbor].formUnion(ancestors[node])
            }
        }
        
        return ancestors.map { $0.sorted() }
    }
}
