//
//  MinimumFallingPathSum.swift
//  https://leetcode.com/problems/minimum-falling-path-sum/
//
//  Created by Erik Radicheski da Silva on 11/12/22.
//

import XCTest

final class MinimumFallingPathSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minFallingPathSum([[2, 1, 3], [6, 5, 4], [7, 8, 9]]), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minFallingPathSum([[-19, 57], [-40, -5]]), -59)
    }

}

private class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        guard matrix.count > 1 else { return matrix[0][0] }
        
        var result = matrix.last!
        
        for rowValue in matrix[..<(matrix.endIndex - 1)].reversed() {
            var nextResult: [Int] = Array(repeating: .max, count: rowValue.count)
            
            for (columnIndex, columnValue) in rowValue.enumerated() {
                let left = columnIndex == 0 ? Int.max : result[columnIndex - 1]
                let center = result[columnIndex]
                let right = columnIndex + 1 >= rowValue.endIndex ? Int.max : result[columnIndex + 1]
                
                nextResult[columnIndex] = min(left, center, right) + columnValue
            }
            
            result = nextResult
        }
        
        return result.min()!
    }
}
