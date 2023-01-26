//
//  ShortestBridge.swift
//  https://leetcode.com/problems/shortest-bridge/
//
//  Created by Erik Radicheski da Silva on 26/01/23.
//

import XCTest

final class ShortestBridge: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let grid = [[0, 1],
                    [1, 0]]
        XCTAssertEqual(solution.shortestBridge(grid), 1)
    }
    
    
    func testExampleB() {
        let grid = [[0, 1, 0],
                    [0, 0, 0],
                    [0, 0, 1]]
        XCTAssertEqual(solution.shortestBridge(grid), 2)
    }
    
    func testExampleC() {
        let grid = [[1, 1, 1, 1, 1],
                    [1, 0, 0, 0, 1],
                    [1, 0, 1, 0, 1],
                    [1, 0, 0, 0, 1],
                    [1, 1, 1, 1, 1]]
        XCTAssertEqual(solution.shortestBridge(grid), 1)
    }

}

private class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var islands = [[(x: Int, y: Int)]]()
        
        var visited = grid.map { $0.map { _ in false } }
        
        for x in grid.indices {
            for y in grid[x].indices {
                guard visited[x][y] == false else { continue }
                
                if grid[x][y] == 0 {
                    let _ = mapIsland(grid, 0, x, y, &visited)
                } else {
                    islands.append(mapIsland(grid, 1, x, y, &visited))
                }
            }
        }
        
        var distance = Int.max
        
        for plot1 in islands[0] {
            for plot2 in islands[1] {
                distance = min(distance, abs(plot1.x - plot2.x) + abs(plot1.y - plot2.y) - 1)
            }
        }
        
        return distance
    }
    
    private func mapIsland(_ grid: [[Int]], _ target: Int, _ x: Int, _ y: Int, _ visited: inout [[Bool]]) -> [(x: Int, y: Int)] {
        guard grid.indices.contains(x) else { return [] }
        guard grid[x].indices.contains(y) else { return [] }
        
        guard visited[x][y] == false else { return [] }
        
        guard grid[x][y] == target else { return [] }
        
        visited[x][y] = true
        
        let north = mapIsland(grid, target, x - 1, y, &visited)
        let south = mapIsland(grid, target, x + 1, y, &visited)
        let west = mapIsland(grid, target, x, y - 1, &visited)
        let east = mapIsland(grid, target, x, y + 1, &visited)
        
        return [(x, y)] + north + south + west + east
    }
}
