//
//  TransposeMatrix.swift
//  https://leetcode.com/problems/transpose-matrix/
//
//  Created by Erik Radicheski da Silva on 10/12/23.
//

import XCTest

final class TransposeMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]),
                       [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]])
    }
}

private class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        let n = matrix[0].count
        
        var answer = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for (i, row) in matrix.enumerated() {
            for (j, num) in row.enumerated() {
                answer[j][i] = num
            }
        }
        
        return answer
    }
}
