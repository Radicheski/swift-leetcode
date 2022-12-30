//
//  SortIntegersByTheNumberOf1Bits.swift
//  https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/
//
//  Created by Erik Radicheski da Silva on 30/12/22.
//

import XCTest

final class SortIntegersByTheNumberOf1Bits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortByBits([0, 1, 2, 3, 4, 5, 6, 7, 8]), [0, 1, 2, 4, 8, 3, 5, 6, 7])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortByBits([1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1]), [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024])
    }

}

private class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        arr.sorted { $0.nonzeroBitCount == $1.nonzeroBitCount ? ($0 < $1) : ($0.nonzeroBitCount < $1.nonzeroBitCount) }
    }
}
