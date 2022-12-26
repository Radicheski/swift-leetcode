//
//  MatrixDiagonalSum.swift
//  https://leetcode.com/problems/matrix-diagonal-sum/
//
//  Created by Erik Radicheski da Silva on 26/12/22.
//

import XCTest

final class MatrixDiagonalSum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.diagonalSum([[1,2,3],
                                             [4,5,6],
                                             [7,8,9]]), 25)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.diagonalSum([[1,1,1,1],
                                             [1,1,1,1],
                                             [1,1,1,1],
                                             [1,1,1,1]]), 8)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.diagonalSum([[5]]), 5)
    }

}

private class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var sum = 0
        let size = mat.count
        
        for i in 0 ..< size {
            sum += mat[i][i]
            if i != size - i - 1 {
                sum += mat[i][size - i - 1]
            }
        }
        
        return sum
    }
}
