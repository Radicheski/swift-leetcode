//
//  CountOddNumbersInAnIntervalRange.swift
//  https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/
//
//  Created by Erik Radicheski da Silva on 20/12/22.
//

import XCTest

final class CountOddNumbersInAnIntervalRange: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countOdds(3, 7), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countOdds(8, 10), 1)
    }

}

private class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        var result = (high - low + (low % 2)) / 2
        result += high % 2
        
        return result
    }
}
