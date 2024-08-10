//
//  RegionsCutBySlashes.swift
//  https://leetcode.com/problems/regions-cut-by-slashes/
//
//  Created by Erik Radicheski da Silva on 10/08/24.
//

import XCTest

final class RegionsCutBySlashes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.regionsBySlashes([" /", "/ "]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.regionsBySlashes([" /", "  "]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.regionsBySlashes(["/\\", "\\/"]), 5)
    }
    
}

private class Solution {
    func regionsBySlashes(_ grid: [String]) -> Int {
        let grid = grid.map(Array.init)
        var expandedGrid = Array(repeating: Array(repeating: 0, count: grid.count * 3), count: grid.count * 3)
        
        for i in grid.indices {
            for j in grid.indices where grid[i][j] != " " {
                let (row, col) = (i * 3, j * 3)
                expandedGrid[row + 1][col + 1] = 1
                
                if grid[i][j] == "/" {
                    expandedGrid[row + 2][col] = 1
                    expandedGrid[row][col + 2] = 1
                } else if grid[i][j] == "\\" {
                    expandedGrid[row][col] = 1
                    expandedGrid[row + 2][col + 2] = 1
                }
            }
        }
        
        var count = 0
        var visited = Set<[Int]>()
        
        for i in expandedGrid.indices {
            for j in expandedGrid.indices {
                guard visited.contains([i, j]) == false && expandedGrid[i][j] == 0 else { continue }
                count += 1
                flood(expandedGrid, i, j, &visited)
            }
        }
        
        return count
    }
    
    private func flood(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: inout Set<[Int]>) {
        guard grid.indices.contains(row) else { return }
        guard grid[row].indices.contains(col) else { return }
        
        let (isNotVisited, _) = visited.insert([row, col])
        guard isNotVisited else { return }
        
        guard grid[row][col] == 0 else { return }
        
        flood(grid, row - 1, col, &visited)
        flood(grid, row + 1, col, &visited)
        flood(grid, row, col - 1, &visited)
        flood(grid, row, col + 1, &visited)
    }
}
