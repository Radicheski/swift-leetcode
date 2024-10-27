//
//  CountSquareSubmatricesWithAllOnes.swift
//  https://leetcode.com/problems/count-square-submatrices-with-all-ones/
//
//  Created by Erik Radicheski da Silva on 27/10/24.
//

import XCTest

final class CountSquareSubmatricesWithAllOnes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSquares([
            [0,1,1,1],
            [1,1,1,1],
            [0,1,1,1]
          ]), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSquares([
            [1,0,1],
            [1,1,0],
            [1,1,0]
          ]), 7)
    }
    
}

private class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var dp: [[Int?]] = matrix.map { $0.map { _ in nil } }
        var answer = 0
        
        for i in matrix.indices {
            for j in matrix[i].indices {
                answer += solve(i, j, matrix, &dp)
            }
        }
        
        return answer
    }
    
    private func solve(_ i: Int, _ j: Int, _ grid: [[Int]], _ dp: inout [[Int?]]) -> Int {
        guard grid.indices.contains(i) else { return 0 }
        guard grid[i].indices.contains(j) else { return 0 }
        guard grid[i][j] != 0 else { return 0 }
        
        if let answer = dp[i][j] {
            return answer
        }
        
        let right = solve(i, j + 1, grid, &dp)
        let diagonal = solve(i + 1, j + 1, grid, &dp)
        let below = solve(i + 1, j, grid, &dp)
        
        let answer = 1 + min(right, diagonal, below)
        
        dp[i][j] = answer
        
        return answer
    }
}
