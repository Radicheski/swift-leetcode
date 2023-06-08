//
//  CountNegativeNumbersInASortedMatrix.swift
//  https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
//
//  Created by Erik Radicheski da Silva on 08/06/23.
//

import XCTest

final class CountNegativeNumbersInASortedMatrix: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countNegatives([[4, 3, 2, -1],
                                                [3, 2, 1, -1],
                                                [1, 1, -1, -2],
                                                [-1, -1, -2, -3]]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countNegatives([[3, 2], [1, 0]]), 0)
    }

}

private class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        return grid.reduce(into: 0) {
            $0 += $1.filter { $0 < 0 }.count
        }
    }
}
