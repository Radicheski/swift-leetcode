//
//  NumberOfIslands.swift
//  https://leetcode.com/problems/number-of-islands/
//
//  Created by Erik Radicheski da Silva on 24/08/22.
//

import XCTest

class NumberOfIslands: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        let input: [[Character]] = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]
        XCTAssertEqual(solution.numIslands(input), 1)
    }
    
    func testExampleB() {
        let input: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ]
        XCTAssertEqual(solution.numIslands(input), 3)
    }

}

private class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var islandCount = 0
        
        var visited = grid.map { row in
            row.map { _ in false }
        }
        
        for rowIndex in 0..<visited.count {
            for columnIndex in 0..<visited[0].count {
                if visited[rowIndex][columnIndex] == true { continue }
                
                let node = (row: rowIndex, column: columnIndex)
                
                if grid[node.row][node.column] == "1" {
                    islandCount += 1
                    
                    var queue = [node]
                    
                    while !queue.isEmpty {
                        let node = queue.removeFirst()
                        
                        if visited[node.row][node.column] == true { continue }
                        
                        visited[node.row][node.column] = true
                        
                        let north = (row: node.row - 1, column: node.column)
                        if checkIndex(grid, index: north)
                            && grid[north.row][north.column] == "1" {
                                queue.append(north)
                        }
                        
                        let south = (row: node.row + 1, column: node.column)
                        if checkIndex(grid, index: south)
                            && grid[south.row][south.column] == "1" {
                                queue.append(south)
                        }
                        
                        let east = (row: node.row, column: node.column - 1)
                        if checkIndex(grid, index: east)
                            && grid[east.row][east.column] == "1" {
                                queue.append(east)
                        }
                        
                        let west = (row: node.row, column: node.column + 1)
                        if checkIndex(grid, index: west)
                            && grid[west.row][west.column] == "1" {
                                queue.append(west)
                        }
                    }
                    
                    visited[node.row][node.column] = true
                }
            }
        }
        
        return islandCount
    }
    
    private func checkIndex(_ grid: [[Character]], index: (row: Int, column: Int)) -> Bool {
        let rowRange = 0..<grid.count
        if !rowRange.contains(index.row) { return false }
        
        let columnRange = 0..<grid[0].count
        if !columnRange.contains(index.column) { return false }
        
        return true
    }
}
