//
//  NumberOfIncreasingPathsInAGrid.swift
//  https://leetcode.com/problems/number-of-increasing-paths-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 18/06/23.
//

import XCTest

final class NumberOfIncreasingPathsInAGrid: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countPaths([[1, 1], [3, 4]]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countPaths([[1], [2]]), 3)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countPaths(_ grid: [[Int]]) -> Int {
        var dp = [[Int]: Int]()
        
        var answer = 0
        
        for i in grid.indices {
            for j in grid[i].indices {
                answer += 1
                
                answer += depthFirst(grid[i][j], i - 1, j, grid, &dp) % mod
                answer += depthFirst(grid[i][j], i + 1, j, grid, &dp) % mod
                answer += depthFirst(grid[i][j], i, j - 1, grid, &dp) % mod
                answer += depthFirst(grid[i][j], i, j + 1, grid, &dp) % mod
            }
            answer %= mod
        }
        
        return answer
    }
    
    private func depthFirst(_ prev: Int, _ i: Int, _ j: Int,
                            _ grid: [[Int]], _ dp: inout [[Int]: Int]) -> Int {
        guard grid.indices.contains(i) else { return 0 }
        guard grid[i].indices.contains(j) else { return 0 }
        guard grid[i][j] > prev else { return 0 }
        
        if let answer = dp[[i, j]] {
            return answer
        }
        
        var answer = 1
        
        answer += depthFirst(grid[i][j], i - 1, j, grid, &dp) % mod
        answer += depthFirst(grid[i][j], i + 1, j, grid, &dp) % mod
        answer += depthFirst(grid[i][j], i, j - 1, grid, &dp) % mod
        answer += depthFirst(grid[i][j], i, j + 1, grid, &dp) % mod
        
        answer %= mod
        
        dp[[i, j]] = answer
        
        return answer
    }
}
