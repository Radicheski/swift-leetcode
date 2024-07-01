//
//  ThreeConsecutiveOdds.swift
//  https://leetcode.com/problems/three-consecutive-odds/description/
//
//  Created by Erik Radicheski da Silva on 01/07/24.
//

import XCTest

final class ThreeConsecutiveOdds: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.threeConsecutiveOdds([2, 6, 4, 1]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.threeConsecutiveOdds([1, 2, 34, 3, 4, 5, 7, 23,  12]))
    }
    
}

private class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        var counter = 0
        
        for num in arr {
            if num.isMultiple(of: 2) {
                counter = 0
            } else {
                counter += 1
            }
            
            guard counter < 3 else { return true }
        }
        
        return false
    }
}
