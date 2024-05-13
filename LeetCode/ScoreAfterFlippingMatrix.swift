//
//  ScoreAfterFlippingMatrix.swift
//  https://leetcode.com/problems/score-after-flipping-matrix/
//
//  Created by Erik Radicheski da Silva on 13/05/24.
//

import XCTest

final class ScoreAfterFlippingMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.matrixScore([[0, 0, 1, 1], [1, 0, 1, 0], [1, 1, 0, 0]]), 39)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.matrixScore([[0]]), 1)
    }
    
}

private class Solution {
    func matrixScore(_ grid: [[Int]]) -> Int {
        var grid = grid
        
        for i in grid.indices where grid[i][0] == 0 {
            for j in grid[i].indices {
                grid[i][j] = 1 - grid[i][j]
            }
        }
        
        for i in grid[0].indices where i > 0 {
            var count = 0
            
            for j in grid.indices where grid[j][i] == 1 {
                count += 1
            }
            
            if count < (grid.count + 1) / 2 {
                for j in grid.indices {
                    grid[j][i] = 1 - grid[j][i]
                 }
            }
        }
        
        var answer = 0
        
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] == 1 {
                answer += 1 << (grid[i].count - j - 1)
            }
        }
        
        return answer
    }
}
