//
//  MinimumNumberOfDaysToDisconnectIsland.swift
//  https://leetcode.com/problems/minimum-number-of-days-to-disconnect-island/
//
//  Created by Erik Radicheski da Silva on 11/08/24.
//

import XCTest

final class MinimumNumberOfDaysToDisconnectIsland: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDays([[0, 1, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDays([[1, 1]]), 2)
    }
    
}

private class Solution {
    func minDays(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        let rows = grid.count
        let cols = grid[0].count
        
        let initialCount = countIslands(grid)
        
        guard initialCount == 1 else { return 0 }
        
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                guard grid[row][col] == 1 else { continue }
                
                grid[row][col] = 0
                
                guard countIslands(grid) == 1 else { return 1 }
                
                grid[row][col] = 1
            }
        }
        
        return 2
    }
    
    private func countIslands(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        var count = 0
        
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                guard visited[row][col] == false else { continue }
                guard grid[row][col] == 1 else { continue }
                
                exploreIsland(grid, row, col, &visited)
                
                count += 1
            }
        }
        
        return count
    }
    
    private func exploreIsland(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
        guard grid.indices.contains(row) else { return }
        guard grid[row].indices.contains(col) else { return }
        guard grid[row][col] == 1 else { return }
        guard visited[row][col] == false else { return }
        
        let directions: [(dRow: Int, dCol: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        visited[row][col] = true
        
        for direction in directions {
            exploreIsland(grid, row + direction.dRow, col + direction.dCol, &visited)
        }
    }
}
