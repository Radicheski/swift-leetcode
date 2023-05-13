//
//  CountWaysToBuildGoodStrings.swift
//  https://leetcode.com/problems/count-ways-to-build-good-strings/
//
//  Created by Erik Radicheski da Silva on 13/05/23.
//

import XCTest

final class CountWaysToBuildGoodStrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countGoodStrings(3, 3, 1, 1), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countGoodStrings(2, 3, 1, 2), 5)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        var lengths = Array(repeating: 0, count: high + 1)
        lengths[0] = 1
        
        var validStrings = 0
        
        for end in 1 ... high {
            if end - zero >= 0 {
                lengths[end] += lengths[end - zero]
                lengths[end] %= mod
            }
            
            if end - one >= 0 {
                lengths[end] += lengths[end - one]
                lengths[end] %= mod
            }
            
            if end >= low {
                validStrings += lengths[end]
                validStrings %= mod
            }
        }
        
        return validStrings
    }
}
