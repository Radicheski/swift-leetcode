//
//  MinimumScoreOfAPathBetweenTwoCities.swift
//  https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities/
//
//  Created by Erik Radicheski da Silva on 22/03/23.
//

import XCTest

final class MinimumScoreOfAPathBetweenTwoCities: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minScore(4, [[1, 2, 9], [2, 3, 6], [2, 4, 5], [1, 4, 7]]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minScore(4, [[1, 2, 2], [1, 3, 4], [3, 4, 7]]), 2)
    }
    
}

private class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var neighbors = [Int: [(dest: Int, score: Int)]]()
        
        for road in roads {
            neighbors[road[0], default: []].append((road[1], road[2]))
            neighbors[road[1], default: []].append((road[0], road[2]))
        }
        
        var queue = [1]
        
        var visited = Set(queue)
        
        var minimumScore = Int.max
        
        while let node = queue.popLast() {
            guard let neighborList = neighbors[node] else { continue }
            
            for neighbor in neighborList {
                minimumScore = min(minimumScore, neighbor.score)
                if visited.contains(neighbor.dest) == false {
                    visited.insert(neighbor.dest)
                    queue.append(neighbor.dest)
                }
            }
            
        }
        
        return minimumScore
    }
    
}
