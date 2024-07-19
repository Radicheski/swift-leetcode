//
//  LuckyNumbersInAMatrix.swift
//  https://leetcode.com/problems/lucky-numbers-in-a-matrix/
//
//  Created by Erik Radicheski da Silva on 19/07/24.
//

import XCTest

final class LuckyNumbersInAMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.luckyNumbers([[3, 7, 8], [9, 11, 13], [15, 16, 17]]), [15])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.luckyNumbers([[1, 10, 4, 2], [9, 3, 8, 7], [15, 16, 17, 12]]), [12])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.luckyNumbers([[7, 8], [1, 2]]), [7])
    }
    
}

private class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        var rows = Array(repeating: Int.max, count: matrix.count)
        var columns = Array(repeating: Int.min, count: matrix[0].count)
        
        for (i, row) in matrix.enumerated() {
            for (j, number) in row.enumerated() {
                rows[i] = min(rows[i], number)
                columns[j] = max(columns[j], number)
            }
        }
        
        return Set(rows).intersection(columns).map { $0 }
    }
}
