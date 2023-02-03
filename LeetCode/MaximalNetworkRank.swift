//
//  MaximalNetworkRank.swift
//  https://leetcode.com/problems/maximal-network-rank/
//
//  Created by Erik Radicheski da Silva on 03/02/23.
//

import XCTest

final class MaximalNetworkRank: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximalNetworkRank(4, [[0, 1], [0, 3], [1, 2], [1, 3]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximalNetworkRank(5, [[0, 1], [0, 3], [1, 2], [1, 3], [2, 3], [2, 4]]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximalNetworkRank(8, [[0, 1], [1, 2], [2, 3], [2, 4], [5, 6], [5, 7]]), 5)
    }

}

private class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var roadsCount = Array(repeating: 0, count: n)
        
        var connections = Set([[Int]]())
        
        for road in roads {
            roadsCount[road[0]] += 1
            roadsCount[road[1]] += 1
            
            connections.insert(road)
            connections.insert(road.reversed())
        }
        
        var maximalRank = Int.min
        
        for i in roadsCount.indices {
            for j in roadsCount.indices where i != j {
                var rank = roadsCount[i] + roadsCount[j]
                if connections.contains([i, j]) {
                    rank -= 1
                }
                
                maximalRank = max(maximalRank, rank)
            }
        }
        
        return maximalRank
    }
}
