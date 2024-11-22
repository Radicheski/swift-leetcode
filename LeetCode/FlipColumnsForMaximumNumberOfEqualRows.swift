//
//  FlipColumnsForMaximumNumberOfEqualRows.swift
//  https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows/
//
//  Created by Erik Radicheski da Silva on 22/11/24.
//

import XCTest

final class FlipColumnsForMaximumNumberOfEqualRows: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxEqualRowsAfterFlips([[0, 1], [1, 1]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxEqualRowsAfterFlips([[0, 1], [1, 0]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxEqualRowsAfterFlips([[0, 0, 0], [0, 0, 1], [1, 1, 0]]), 2)
    }
    
}

private class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var frequencies = [[Int]: Int]()
        
        matrix.forEach { row in
            frequencies[row.map { $0 == row[0] ? 1 : 0 }, default: 0] += 1
        }
        
        return frequencies.values.max() ?? -1
    }
}
