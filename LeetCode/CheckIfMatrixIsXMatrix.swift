//
//  CheckIfMatrixIsXMatrix.swift
//  https://leetcode.com/problems/check-if-matrix-is-x-matrix/
//
//  Created by Erik Radicheski da Silva on 04/02/23.
//

import XCTest

final class CheckIfMatrixIsXMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkXMatrix([[2, 0, 0, 1],
                                             [0, 3, 1, 0],
                                             [0, 5, 2, 0],
                                             [4, 0, 0, 2]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.checkXMatrix([[5, 7, 0],
                                              [0, 3, 1],
                                              [0, 5, 0]]))
    }

}

private class Solution {
    func checkXMatrix(_ grid: [[Int]]) -> Bool {
        let n = grid.endIndex - 1
        
        for i in grid.indices {
            for j in grid[i].indices {
                if i == j || i + j == n {
                    guard grid[i][j] > 0 else { return false }
                } else {
                    guard grid[i][j] == 0 else { return false }
                }
            }
        }
        
        return true
    }
}
