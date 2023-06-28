//
//  PathWithMaximumProbability.swift
//  https://leetcode.com/problems/path-with-maximum-probability/
//
//  Created by Erik Radicheski da Silva on 28/06/23.
//

import XCTest

final class PathWithMaximumProbability: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProbability(3, [[0, 1], [1, 2], [0, 2]], [0.5, 0.5, 0.2], 0, 2), 0.25, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProbability(3, [[0, 1], [1, 2], [0, 2]], [0.5, 0.5, 0.3], 0, 2), 0.3, accuracy: 1e-5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxProbability(3, [[0, 1]], [0.5], 0, 2), 0, accuracy: 1e-5)
    }

}

private class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var adj = [Int: [(Int, Double)]]()
        
        for (i, edge) in edges.enumerated() {
            adj[edge[0], default: []].append((edge[1], succProb[i]))
            adj[edge[1], default: []].append((edge[0], succProb[i]))
        }
        
        var maxProb = Array(repeating: 0.0, count: n)
        maxProb[start] = 1
        var queue = [start]
        
        while queue.isEmpty == false {
            let currentNode = queue.removeFirst()
            
            for (nextNode, nextProb) in adj[currentNode, default: []] {
                if maxProb[currentNode] * nextProb > maxProb[nextNode] {
                    maxProb[nextNode] = maxProb[currentNode] * nextProb
                    queue.append(nextNode)
                }
            }
        }
        
        return maxProb[end]
    }
}
