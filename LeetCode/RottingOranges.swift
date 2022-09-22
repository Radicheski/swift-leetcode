//
//  RottingOranges.swift
//  https://leetcode.com/problems/rotting-oranges/
//
//  Created by Erik Radicheski da Silva on 22/09/22.
//

import XCTest

final class RottingOranges: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
        XCTAssertEqual(solution.orangesRotting(input), 4)
    }
    
    func testExampleB() {
        let input = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
        XCTAssertEqual(solution.orangesRotting(input), -1)
    }
    
    func testExampleC() {
        let input = [[0, 2]]
        XCTAssertEqual(solution.orangesRotting(input), 0)
    }
    
}

private class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if !hasRottenOrange(grid) {
            if hasFreshOrange(grid) {
                return -1
            } else {
                return 0
            }
        }
        
        var grid = grid
        
        var counter = 0
        
        var freshToRotten = [(row: Int, column: Int)]()
        
        repeat {
            freshToRotten.removeAll()
            
            getRottenOranges(grid).forEach {
                freshToRotten.append(contentsOf: getAdjacentFresh(grid, $0))
            }
            
            freshToRotten.forEach {
                grid[$0.row][$0.column] = 2
            }
            
            if !freshToRotten.isEmpty { counter += 1 }
            
        } while !freshToRotten.isEmpty
        
        if hasFreshOrange(grid) { return -1 }
        
        return counter
    }
    
    private func getRottenOranges(_ grid: [[Int]]) -> [(row: Int, column: Int)] {
        var result = [(row: Int, column: Int)]()
        
        for (rowIndex, row) in grid.enumerated() {
            for (columnIndex, cell) in row.enumerated() {
                if cell == 2 {
                    result.append((rowIndex, columnIndex))
                }
            }
        }

        return result
    }
    
    private func getAdjacentFresh(_ grid: [[Int]], _ position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        assert(grid[position.row][position.column] == 2)
        
        let rowRange = 0 ..< grid.count
        let columnRange = 0 ..< grid[0].count
        
        var result = [(row: Int, column: Int)]()
        
        let north = (row: position.row - 1, column: position.column)
        if rowRange.contains(north.row)
            && columnRange.contains(north.column)
            && grid[north.row][north.column] == 1 {
            result.append(north)
        }
        
        let south = (row: position.row + 1, column: position.column)
        if rowRange.contains(south.row)
            && columnRange.contains(south.column)
            && grid[south.row][south.column] == 1 {
            result.append(south)
        }
        
        let west = (row: position.row, column: position.column - 1)
        if rowRange.contains(west.row)
            && columnRange.contains(west.column)
            && grid[west.row][west.column] == 1 {
            result.append(west)
        }
        
        let east = (row: position.row, column: position.column + 1)
        if rowRange.contains(east.row)
            && columnRange.contains(east.column)
            && grid[east.row][east.column] == 1 {
            result.append(east)
        }
        
        return result
    }
    
    private func hasRottenOrange(_ grid: [[Int]]) -> Bool {
        return grid.compactMap( { $0.max() } ).max() == 2
    }
    
    private func hasFreshOrange(_ grid: [[Int]]) -> Bool {
        for row in grid {
            for cell in row {
                if cell == 1 { return true }
            }
        }
        
        return false
    }
}
