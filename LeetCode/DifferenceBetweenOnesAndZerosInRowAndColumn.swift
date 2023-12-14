//
//  DifferenceBetweenOnesAndZerosInRowAndColumn.swift
//  https://leetcode.com/problems/difference-between-ones-and-zeros-in-row-and-column/
//
//  Created by Erik Radicheski da Silva on 14/12/23.
//

import XCTest

final class DifferenceBetweenOnesAndZerosInRowAndColumn: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.onesMinusZeros([[0, 1, 1], [1, 0, 1], [0, 0, 1]]),
                       [[0, 0, 4], [0, 0, 4], [-2, -2, 2]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.onesMinusZeros([[1, 1, 1], [1, 1, 1]]), [[5, 5, 5], [5, 5, 5]])
    }
    
}

private class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        
        var diff = Array(repeating: Array(repeating: 0, count: n), count: m)
        var rows = Array(repeating: 0, count: m)
        var cols = Array(repeating: 0, count: n)
        
        for (i, row) in grid.enumerated() {
            for (j, num) in row.enumerated() {
                rows[i] += num == 1 ? 1 : -1
                cols[j] += num == 1 ? 1 : -1
            }
        }
        
        for i in grid.indices {
            for j in grid[0].indices {
                diff[i][j]  = rows[i] + cols[j]
            }
        }
        
        return diff
    }
}
