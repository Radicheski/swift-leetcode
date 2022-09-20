//
//  MaxAreaOfIsland.swift
//  https://leetcode.com/problems/max-area-of-island/
//
//  Created by Erik Radicheski da Silva on 20/09/22.
//

import XCTest

final class MaxAreaOfIsland: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                     [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                     [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
                     [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]
        XCTAssertEqual(solution.maxAreaOfIsland(input), 6)
    }
    
    func testExampleB() {
        let input = [[0, 0, 0, 0, 0, 0, 0, 0]]
        XCTAssertEqual(solution.maxAreaOfIsland(input), 0)
    }

}

private class Solution {
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        
        var visited = grid.map { row in
            row.map { _ in false }
        }
        
        for rowIndex in 0..<visited.count {
            for columnIndex in 0..<visited[0].count {
                if visited[rowIndex][columnIndex] { continue }
                
                visited[rowIndex][columnIndex] = true
                
                if grid[rowIndex][columnIndex] == 0 { continue }
                
                var area = 1
                
                var queue = connectedNodes(index: (rowIndex, columnIndex), isVisited: visited)
                
                while !queue.isEmpty {
                    let node = queue.removeFirst()
                    
                    if visited[node.row][node.column] { continue }
                    
                    visited[node.row][node.column] = true
                    
                    if grid[node.row][node.column] == 0 {
                        continue
                    }
                    
                    area += 1
                    
                    queue.append(contentsOf: connectedNodes(index: node, isVisited: visited))
                }
                
                maxArea = max(maxArea, area)
            }
        }
        
        return maxArea
    }
    
    private func connectedNodes(index: (row: Int, column: Int), isVisited: [[Bool]]) -> [(row: Int, column: Int)] {
        let rowRange = 0 ..< isVisited.count
        let columnRange = 0 ..< isVisited[0].count
        
        let north = (row: index.row - 1, column: index.column)
        let south = (row: index.row + 1, column: index.column)
        let west = (row: index.row, column: index.column - 1)
        let east = (row: index.row, column: index.column + 1)
        
        var result = [(row: Int, column: Int)]()
        
        if rowRange.contains(north.row)
            && columnRange.contains(north.column)
            && !isVisited[north.row][north.column] {
            result.append(north)
        }
        
        if rowRange.contains(south.row)
            && columnRange.contains(south.column)
            && !isVisited[south.row][south.column] {
            result.append(south)
        }
        
        if rowRange.contains(west.row)
            && columnRange.contains(west.column)
            && !isVisited[west.row][west.column] {
            result.append(west)
        }
        
        if rowRange.contains(east.row)
            && columnRange.contains(east.column)
            && !isVisited[east.row][east.column] {
            result.append(east)
        }
        
        return result
    }

}
