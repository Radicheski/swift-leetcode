//
//  MapOfHighestPeak.swift
//  https://leetcode.com/problems/map-of-highest-peak/
//
//  Created by Erik Radicheski da Silva on 22/01/25.
//

import XCTest

final class MapOfHighestPeak: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.highestPeak([[0, 1], [0, 0]]), [[1, 0], [2, 1]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.highestPeak([[0, 0, 1], [1, 0, 0], [0, 0, 0]]), [[1, 1, 0], [0, 1, 1], [1, 2, 2]])
    }
    
}

private class Solution {
    
    private let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        var queue = [(i: Int, j: Int)]()
        var map = Array(repeating: Array(repeating: -1, count: isWater[0].count), count: isWater.count)
        
        for (i, row) in isWater.enumerated() {
            for (j, col) in row.enumerated() {
                if col == 1 {
                    queue.append((i, j))
                    map[i][j] = 0
                }
            }
        }
        
        var height = 1
        var nextQueue = [(i: Int, j: Int)]()
        
        while queue.isEmpty == false {
            
            for (i, j) in queue {
                for (di, dj) in directions {
                    guard isWater.indices.contains(i + di) else { continue }
                    guard isWater[i + di].indices.contains(j + dj) else { continue }
                    guard map[i + di][j + dj] == -1 else { continue }
                    
                    map[i + di][j + dj] = height
                    nextQueue.append((i + di, j + dj))
                }
            }
            
            height += 1
            queue = nextQueue
            nextQueue.removeAll(keepingCapacity: true)
        }
        
        return map
    }
}
