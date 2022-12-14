//
//  MaximalSquare.swift
//  https://leetcode.com/problems/maximal-square/
//
//  Created by Erik Radicheski da Silva on 14/12/22.
//

import XCTest

final class MaximalSquare: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximalSquare([["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"],
                                               ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximalSquare([["0", "1"], ["1", "0"]]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximalSquare([["0"]]), 0)
    }

}

private class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        
        var dp = Array(repeating: 0, count: n + 1)
        var maxSide = 0
        var previous = 0
        
        for row in 1 ... m {
            for column in 1 ... n {
                let temp = dp[column]
                if matrix[row - 1][column - 1] == "1" {
                    dp[column] = min(dp[column], dp[column - 1], previous) + 1
                    maxSide = max(maxSide, dp[column])
                } else {
                    dp[column] = 0
                }
                previous = temp
            }
        }
        
        return maxSide * maxSide
    }
}
