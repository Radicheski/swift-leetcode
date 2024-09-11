//
//  MinimumBitFlipsToConvertNumber.swift
//  https://leetcode.com/problems/minimum-bit-flips-to-convert-number/
//
//  Created by Erik Radicheski da Silva on 11/09/24.
//

import XCTest

final class MinimumBitFlipsToConvertNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minBitFlips(10, 7), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minBitFlips(3, 4), 3)
    }
    
}

private class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        return (start ^ goal).nonzeroBitCount
    }
}
