//
//  CheckIfNumberIsASumOfPowersOfThree.swift
//  https://leetcode.com/problems/check-if-number-is-a-sum-of-powers-of-three/
//
//  Created by Erik Radicheski da Silva on 04/03/25.
//

import XCTest

final class CheckIfNumberIsASumOfPowersOfThree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkPowersOfThree(12))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.checkPowersOfThree(91))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.checkPowersOfThree(21))
    }
    
}

private class Solution {
    func checkPowersOfThree(_ n: Int) -> Bool {
        var n = n
        
        while n > 0 {
            if n % 3 == 2 { return false }
            n /= 3
        }
        
        return true
    }
}
