//
//  PowerOfTwo.swift
//  https://leetcode.com/problems/power-of-two/
//
//  Created by Erik Radicheski da Silva on 26/09/22.
//

import XCTest

final class PowerOfTwo: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isPowerOfTwo(1))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isPowerOfTwo(16))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.isPowerOfTwo(3))
    }

}

private class Solution {
    
    func isPowerOfTwo(_ n: Int) -> Bool {
        for i in 0 ... 32 {
            if n == 1 << i {
                return true
            }
        }
        return false
    }
    
}
