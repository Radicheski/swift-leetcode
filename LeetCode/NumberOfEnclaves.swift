//
//  NumberOfEnclaves.swift
//  https://leetcode.com/problems/number-of-enclaves/
//
//  Created by Erik Radicheski da Silva on 23/01/23.
//

import XCTest

final class NumberOfEnclaves: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let grid = [[0, 0, 0, 0],
                    [1, 0, 1, 0],
                    [0, 1, 1, 0],
                    [0, 0, 0, 0]]
        XCTAssertEqual(solution.numEnclaves(grid), 3)
    }
    
    func testExampleB() {
        let grid = [[0, 1, 1, 0],
                    [0, 0, 1, 0],
                    [0, 0, 1, 0],
                    [0, 0, 0, 0]]
        XCTAssertEqual(solution.numEnclaves(grid), 0)
    }

}

private class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var visited = grid.map { $0.map { _ in false } }
        
        let (minX, maxX) = (grid.startIndex, grid.endIndex - 1)
        let (minY, maxY) = (grid[0].startIndex, grid[0].endIndex - 1)
        
        var counter: Int?
        
        for x in minX ... maxX {
            expand(grid, grid[x][minY], (x, minY), &visited, &counter)
            expand(grid, grid[x][maxY], (x, maxY), &visited, &counter)
        }
        
        for y in minY ... maxY {
            expand(grid, grid[minX][y], (minX, y), &visited, &counter)
            expand(grid, grid[maxX][y], (maxX, y), &visited, &counter)
        }
        
        counter = 0
        
        for x in minX ... maxX {
            for y in minY ... maxY {
                expand(grid, 1, (x, y), &visited, &counter)
            }
        }
        
        return counter ?? 0
    }
    
    private func expand(_ grid: [[Int]], _ target: Int, _ origin: (x: Int, y: Int), _ visited: inout [[Bool]], _ counter: inout Int?) {
        let (x,y) = origin
        
        guard grid.indices.contains(x) else { return }
        guard grid[x].indices.contains(y) else { return }
        
        guard grid[x][y] == target else { return }
        
        guard visited[x][y] == false else { return }
        
        visited[x][y] = true
        counter? += 1
        
        expand(grid, target, (x - 1, y), &visited, &counter)
        expand(grid, target, (x + 1, y), &visited, &counter)
        expand(grid, target, (x, y - 1), &visited, &counter)
        expand(grid, target, (x, y + 1), &visited, &counter)
    }
}
