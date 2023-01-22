//
//  NumberOfClosedIslands.swift
//  https://leetcode.com/problems/number-of-closed-islands/
//
//  Created by Erik Radicheski da Silva on 22/01/23.
//

import XCTest

final class NumberOfClosedIslands: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let grid = [[1, 1, 1, 1, 1, 1, 1, 0],
                    [1, 0, 0, 0, 0, 1, 1, 0],
                    [1, 0, 1, 0, 1, 1, 1, 0],
                    [1, 0, 0, 0, 0, 1, 0, 1],
                    [1, 1, 1, 1, 1, 1, 1, 0]]
        XCTAssertEqual(solution.closedIsland(grid), 2)
    }
    
    func testExampleB() {
        let grid = [[0, 0, 1, 0, 0],
                    [0, 1, 0, 1, 0],
                    [0, 1, 1, 1, 0]]
        XCTAssertEqual(solution.closedIsland(grid), 1)
    }
    
    func testExampleC() {
        let grid = [[1, 1, 1, 1, 1, 1, 1],
                    [1, 0, 0, 0, 0, 0, 1],
                    [1, 0, 1, 1, 1, 0, 1],
                    [1, 0, 1, 0, 1, 0, 1],
                    [1, 0, 1, 1, 1, 0, 1],
                    [1, 0, 0, 0, 0, 0, 1],
                    [1, 1, 1, 1, 1, 1, 1]]
        XCTAssertEqual(solution.closedIsland(grid), 2)
    }

}

private class Solution {
    
    private let land = 0
    private let water = 1
    
    func closedIsland(_ grid: [[Int]]) -> Int {
        var visited = grid.map { $0.map { _ in false } }
        
        let (minX, maxX) = (grid.startIndex, grid.endIndex - 1)
        let (minY, maxY) = (grid[0].startIndex, grid[0].endIndex - 1)
        
        for x in minX ... maxX {
            visit(grid, grid[x][minY], (x, minY), &visited)
            visit(grid, grid[x][maxY], (x, maxY), &visited)
        }
        
        for y in minY ... maxY {
            visit(grid, grid[minX][y], (minX, y), &visited)
            visit(grid, grid[maxX][y], (maxX, y), &visited)
        }
        
        
        var count = 0
        
        for x in minX ... maxX {
            for y in minY ... maxY {
                guard visited[x][y] == false else { continue }
                
                visit(grid, grid[x][y], (x, y), &visited)
                
                if grid[x][y] == land {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private func visit(_ grid: [[Int]], _ target: Int, _ position: (x: Int, y: Int), _ visited: inout [[Bool]]) {
        guard grid.indices.contains(position.x) else { return }
        guard grid[position.x].indices.contains(position.y) else { return }
        
        guard visited[position.x][position.y] == false else { return }
        
        guard grid[position.x][position.y] == target else { return }
        
        visited[position.x][position.y] = true
        
        visit(grid, target, (position.x - 1, position.y), &visited)
        visit(grid, target, (position.x + 1, position.y), &visited)
        visit(grid, target, (position.x, position.y - 1), &visited)
        visit(grid, target, (position.x, position.y + 1), &visited)
    }
}
