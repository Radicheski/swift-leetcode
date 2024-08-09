//
//  MagicSquaresInGrid.swift
//  https://leetcode.com/problems/magic-squares-in-grid/
//
//  Created by Erik Radicheski da Silva on 09/08/24.
//

import XCTest

final class MagicSquaresInGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numMagicSquaresInside([[4, 3, 8, 4], [9, 5, 1, 9], [2, 7, 6, 2]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numMagicSquaresInside([[8]]), 0)
    }
    
}

private class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        var answer = 0
        
        let m = grid.count
        let n = grid[0].count
        
        guard m >= 3 && n >= 3 else { return 0 }
        
        for row in 0 ..< m - 2 {
            for col in 0 ..< n - 2 {
                if isMagicSquare(grid, row, col) {
                    answer += 1
                }
            }
        }
        
        return answer
    }
    
    private func isMagicSquare(_ grid: [[Int]], _ row: Int, _ col: Int) -> Bool {
        var notSeen = Array(repeating: true, count: 10)
        
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                let num = grid[row + i][col + j]
                guard (1 ... 9).contains(num) else { return false }
                guard notSeen[num] else { return false }
                notSeen[num] = false
            }
        }
        
        let diagonal = [
            grid[row][col] + grid[row + 1][col + 1] + grid[row + 2][col + 2],
            grid[row + 2][col] + grid[row + 1][col + 1] + grid[row][col + 2]
        ]
        
        guard diagonal[0] == diagonal[1] else { return false }
        
        var rows = Array(repeating: 0, count: 3)
        var cols = Array(repeating: 0, count: 3)
        
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                rows[i] += grid[row + i][col + j]
                cols[i] += grid[row + j][col + i]
            }
        }
        
        return rows.allSatisfy { $0 == diagonal[0] } && cols.allSatisfy { $0 == diagonal[0] }
    }
}
