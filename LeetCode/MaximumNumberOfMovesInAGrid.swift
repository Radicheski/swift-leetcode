//
//  MaximumNumberOfMovesInAGrid.swift
//  https://leetcode.com/problems/maximum-number-of-moves-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 29/10/24.
//

import XCTest

final class MaximumNumberOfMovesInAGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxMoves([[2, 4, 3, 5], [5, 4, 9, 3], [3, 4, 2, 11], [10, 9, 13, 15]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxMoves([[3, 2, 4], [2, 1, 9], [1, 1, 7]]), 0)
    }
    
}

private class Solution {
    func maxMoves(_ grid: [[Int]]) -> Int {
        var dp: [[Int?]] = grid.map { $0.map { _ in nil} }
        var moves = 0
        
        for row in grid.indices {
            moves = max(moves, maxMoves(row, 0, .min, grid, &dp))
        }
        
        return moves - 1
    }
    
    private func maxMoves(_ row: Int, _ col: Int, _ previous: Int, _ grid: [[Int]], _ dp: inout [[Int?]]) -> Int {
        guard grid.indices.contains(row) else { return 0 }
        guard grid[row].indices.contains(col) else { return 0 }
        guard grid[row][col] > previous else { return 0 }
        
        if let answer = dp[row][col] {
            return answer
        }
        
        let moves = max(maxMoves(row - 1, col + 1, grid[row][col], grid, &dp),
                        maxMoves(row, col + 1, grid[row][col], grid, &dp),
                        maxMoves(row + 1, col + 1, grid[row][col], grid, &dp)) + 1
        
        dp[row][col] = moves
        
        return moves
    }
}
