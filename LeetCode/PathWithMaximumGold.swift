//
//  PathWithMaximumGold.swift
//  https://leetcode.com/problems/path-with-maximum-gold/
//
//  Created by Erik Radicheski da Silva on 14/05/24.
//

import XCTest

final class PathWithMaximumGold: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getMaximumGold([[0, 6, 0], [5, 8, 7], [0, 9, 0]]), 24)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getMaximumGold([[1, 0, 7], [2, 0, 6], [3, 4, 5], [0, 3, 0], [9, 0, 20]]), 28)
    }
    
}

private class Solution {
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var cells = Set<[Int]>()
        
        for (i, row) in grid.enumerated() {
            for (j, cell) in row.enumerated() where cell > 0 {
                cells.insert([i, j])
            }
        }
        
        var answer = 0
        
        for cell in cells {
            answer = max(answer, getMaximumGold(cell[0], cell[1], grid, cells.subtracting([cell])))
        }
        
        return answer
    }
    
    private func getMaximumGold(_ i: Int, _ j: Int, _ grid: [[Int]], _ cells: Set<[Int]>) -> Int {
        var sum = 0
        
        for step in [-1, 1] {
            if cells.contains([i + step, j]) {
                sum = max(sum, getMaximumGold(i + step, j, grid, cells.subtracting([[i + step, j]])))
            }
            
            if cells.contains([i, j + step]) {
                sum = max(sum, getMaximumGold(i, j + step, grid, cells.subtracting([[i, j + step]])))
            }
        }
        
        return grid[i][j] + sum
    }
}
