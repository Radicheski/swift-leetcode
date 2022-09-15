//
//  SquaresOfASortedArray.swift
//  https://leetcode.com/problems/squares-of-a-sorted-array/
//
//  Created by Erik Radicheski da Silva on 15/09/22.
//

import XCTest

final class SquaresOfASortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortedSquares([-4, -1, 0, 3, 10]), [0, 1, 9, 16, 100])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortedSquares([-7, -3, 2, 3, 11]), [4, 9, 9, 49, 121])
    }

}

private class Solution {
    
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map( { $0 * $0 } ).sorted()
    }
    
}
