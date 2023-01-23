//
//  CountSubIslands.swift
//  https://leetcode.com/problems/count-sub-islands/
//
//  Created by Erik Radicheski da Silva on 23/01/23.
//

import XCTest

final class CountSubIslands: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let grid1 = [[1, 1, 1, 0, 0],
                     [0, 1, 1, 1, 1],
                     [0, 0, 0, 0, 0],
                     [1, 0, 0, 0, 0],
                     [1, 1, 0, 1, 1]]
        let grid2 = [[1, 1, 1, 0, 0],
                     [0, 0, 1, 1, 1],
                     [0, 1, 0, 0, 0],
                     [1, 0, 1, 1, 0],
                     [0, 1, 0, 1, 0]]
        XCTAssertEqual(solution.countSubIslands(grid1, grid2), 3)
    }
    
    func testExampleB() {
        let grid1 = [[1, 0, 1, 0, 1],
                     [1, 1, 1, 1, 1],
                     [0, 0, 0, 0, 0],
                     [1, 1, 1, 1, 1],
                     [1, 0, 1, 0, 1]]
        let grid2 = [[0, 0, 0, 0, 0],
                     [1, 1, 1, 1, 1],
                     [0, 1, 0, 1, 0],
                     [0, 1, 0, 1, 0],
                     [1, 0, 0, 0, 1]]
        XCTAssertEqual(solution.countSubIslands(grid1, grid2), 2)
    }

}

private class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        let (maxX, maxY) = (grid1.endIndex - 1, grid1[0].endIndex - 1)
        
        var grid2 = grid2
        
        for x in 0 ... maxX {
            for y in 0 ... maxY {
                if grid1[x][y] != grid2[x][y] {
                    depthFirst(&grid2, x, y)
                }
            }
        }
        
        var count = 0
        
        for x in 0 ... maxX {
            for y in 0 ... maxY {
                if grid2[x][y] == 1 {
                    depthFirst(&grid2, x, y)
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private func depthFirst(_ grid2: inout [[Int]], _ x: Int, _ y: Int) {
        guard grid2.indices.contains(x) else { return }
        guard grid2[x].indices.contains(y) else { return }
        
        guard grid2[x][y] == 1 else { return }
        
        grid2[x][y] = 0
        
        depthFirst(&grid2, x - 1, y)
        depthFirst(&grid2, x + 1, y)
        depthFirst(&grid2, x, y - 1)
        depthFirst(&grid2, x, y + 1)
    }
}
