//
//  MinimumFallingPathSum2.swift
//  https://leetcode.com/problems/minimum-falling-path-sum-ii/
//
//  Created by Erik Radicheski da Silva on 26/04/24.
//

import XCTest

final class MinimumFallingPathSum2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minFallingPathSum([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minFallingPathSum([[7]]), 7)
    }

}

private class Solution {
    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid
        
        for row in 1 ..< grid.endIndex {
            for column in 0 ..< grid[row].endIndex {
                var minimum = Int.max
                
                for nextColumn in 0 ..< grid[row].endIndex where nextColumn != column {
                    minimum = min(minimum, dp[row - 1][nextColumn])
                }
                
                dp[row][column] += minimum
            }
        }
        
        return dp.last!.min()!
    }
}
