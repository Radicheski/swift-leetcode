//
//  MaximumMatrixSum.swift
//  https://leetcode.com/problems/maximum-matrix-sum/
//
//  Created by Erik Radicheski da Silva on 24/11/24.
//

import XCTest

final class MaximumMatrixSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxMatrixSum([[1, -1], [-1, 1]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxMatrixSum([[1, 2, 3], [-1, -2, -3], [1, 2, 3]]), 16)
    }
    
}

private class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var maxSum = 0
        var minAbsolute = Int.max
        var negativeCount = 0
        
        for row in matrix {
            for num in row {
                maxSum += abs(num)
                minAbsolute = min(minAbsolute, abs(num))
                negativeCount += (num < 0) ? 1 : 0
            }
        }
        
        return maxSum - 2 * minAbsolute * (negativeCount % 2)
    }
}
