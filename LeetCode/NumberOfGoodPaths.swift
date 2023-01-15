//
//  NumberOfGoodPaths.swift
//  https://leetcode.com/problems/number-of-good-paths/
//
//  Created by Erik Radicheski da Silva on 15/01/23.
//

import XCTest

final class NumberOfGoodPaths: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfGoodPaths([1, 3, 2, 1, 3], [[0, 1], [0, 2], [2, 3], [2, 4]]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfGoodPaths([1, 1, 2, 2, 3], [[0, 1], [1, 2], [2, 3], [2, 4]]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfGoodPaths([1], []), 1)
    }
    
    func test() {
        measure {
            for _ in 0 ..< 100_000 {
                let _ = solution.numberOfGoodPaths([1, 3, 2, 1, 3], [[0, 1], [0, 2], [2, 3], [2, 4]])
            }
        }
    }

}

private class Solution {
    
    func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
        let nodeCount = vals.count
        
        if nodeCount < 2 { return nodeCount }
        
        let sortedEdges: [(value: Int, nodeA: Int, nodeB: Int)] = edges.map { edge in
            let (nodeA, nodeB) = (edge[0], edge[1])
            let maxValue = max(vals[nodeA], vals[nodeB])
            
            return (maxValue, nodeA, nodeB)
        }.sorted { $0.value < $1.value }
        
        var parents = Array(vals.indices)
        var counts = vals.map { (value: $0, count: 1) }
        var pathCount = 0
        
        for edge in sortedEdges {
            let value = edge.value
            
            let parentA = searchParent(edge.nodeA, &parents)
            let parentB = searchParent(edge.nodeB, &parents)
            
            let countA = counts[parentA]
            let countB = counts[parentB]
            
            if countA.value == countB.value {
                pathCount += countA.count * countB.count
            }
            
            var count = 0
            count += countA.value == value ? countA.count : 0
            count += countB.value == value ? countB.count : 0
            
            parents[parentB] = parentA
            counts[parentA] = (value, count)
        }
        
        return pathCount + nodeCount
        
    }
    
    private func searchParent(_ x: Int, _ parent: inout [Int]) -> Int {
        if parent[x] != x {
            parent[x] = searchParent(parent[x], &parent)
        }
        return parent[x]
    }
    
}
