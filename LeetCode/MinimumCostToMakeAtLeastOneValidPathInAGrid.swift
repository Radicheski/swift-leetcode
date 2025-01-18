//
//  MinimumCostToMakeAtLeastOneValidPathInAGrid.swift
//  https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 18/01/25.
//

import XCTest

final class MinimumCostToMakeAtLeastOneValidPathInAGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCost([[1, 1, 1, 1], [2, 2, 2, 2], [1, 1, 1, 1], [2, 2, 2, 2]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCost([[1, 1, 3], [3, 2, 2], [1, 1, 4]]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minCost([[1, 2], [4, 3]]), 1)
    }
    
}

private class Solution {
    
    private let dirs: [Int: (di: Int, dj: Int)] = [1: (0, 1),
                                                  2: (0, -1),
                                                  3: (1, 0),
                                                  4: (-1, 0)]
    
    func minCost(_ grid: [[Int]]) -> Int {
        var minCost = grid.map { $0.map { _ in Int.max } }
        
        var queue = [(0, 0)]
        minCost[0][0] = 0
        
        while queue.isEmpty == false {
            let (i, j) = queue.removeFirst()
            
            for (dir, (di, dj)) in dirs {
                guard grid.indices.contains(i + di) else { continue }
                guard grid[i + di].indices.contains(j + dj) else { continue }
                
                let cost = grid[i][j] == dir ? 0 : 1
                
                guard minCost[i][j] + cost < minCost[i + di][j + dj] else { continue }
                
                minCost[i + di][j + dj] = minCost[i][j] + cost
                
                if cost == 0 {
                    queue.insert((i + di, j + dj), at: 0)
                } else {
                    queue.append((i + di, j + dj))
                }
            }
        }
        
        return minCost.last!.last!
    }
}
