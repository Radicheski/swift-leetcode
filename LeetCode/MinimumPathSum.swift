//
//  MinimumPathSum.swift
//  https://leetcode.com/problems/minimum-path-sum/
//
//  Created by Erik Radicheski da Silva on 14/12/22.
//

import XCTest

final class MinimumPathSum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minPathSum([[1, 2, 3], [4, 5, 6]]), 12)
    }
    
}

private class Solution {
    
    private let max = 1_000
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        var sum = Array(repeating: Array(repeating: max, count: n + 1), count: m + 1)
        
        for row in (0 ..< m).reversed() {
            for column in (0 ..< n).reversed() {
                if row == m - 1 && column == n - 1 {
                    sum[row][column] = grid[row][column]
                    continue
                }
                
                sum[row][column] = min(sum[row + 1][column], sum[row][column + 1])
                sum[row][column] += grid[row][column]
            }
        }
        
        return sum[0][0]
    }
}
