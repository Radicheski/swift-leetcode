//
//  CountUnreachablePairsOfNodesInAnUndirectedGraph.swift
//  https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/
//
//  Created by Erik Radicheski da Silva on 25/03/23.
//

import XCTest

final class CountUnreachablePairsOfNodesInAnUndirectedGraph: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countPairs(3, [[0, 1], [0, 2], [1, 2]]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countPairs(7, [[0, 2], [0, 5], [2, 4], [1, 6], [5, 4]]), 14)
    }

}

private class Solution {
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        var neighbors = [Int: Set<Int>]()
        
        for edge in edges {
            neighbors[edge[0], default: []].insert(edge[1])
            neighbors[edge[1], default: []].insert(edge[0])
        }
        
        var numberOfPairs = 0
        var sizeOfComponent = 0
        var remainingNodes = n
        
        var visit = Array(repeating: false, count: n)
        
        for i in 0 ..< n {
            if visit[i] == false {
                sizeOfComponent = depthFirst(i, neighbors, &visit)
                numberOfPairs += sizeOfComponent * (remainingNodes - sizeOfComponent)
                remainingNodes -= sizeOfComponent
            }
        }
        
        return numberOfPairs
    }
    
    private func depthFirst(_ node: Int, _ neighbors: [Int: Set<Int>], _ visit: inout [Bool]) -> Int {
        var count = 1
        
        visit[node] = true
        
        guard let neighborList = neighbors[node] else { return count }
        
        for neighbor in neighborList {
            if visit[neighbor] == false {
                count += depthFirst(neighbor, neighbors, &visit)
            }
        }
        
        return count
    }
}
