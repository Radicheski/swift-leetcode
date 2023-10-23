//
//  PowerOfFour.swift
//  https://leetcode.com/problems/power-of-four/
//
//  Created by Erik Radicheski da Silva on 23/10/23.
//

import XCTest

final class PowerOfFour: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isPowerOfFour(16))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isPowerOfFour(5))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.isPowerOfFour(1))
    }

}

private class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        return n.nonzeroBitCount == 1 && n.trailingZeroBitCount.isMultiple(of: 2)
    }
}
