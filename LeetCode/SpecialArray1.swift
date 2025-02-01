//
//  SpecialArray1.swift
//  https://leetcode.com/problems/special-array-i/
//
//  Created by Erik Radicheski da Silva on 01/02/25.
//

import XCTest

final class SpecialArray1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isArraySpecial([1]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isArraySpecial([2, 1, 4]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.isArraySpecial([4, 3, 1, 6]))
    }
    
}

private class Solution {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        
        for i in 1 ..< nums.endIndex {
            if nums[i - 1].isMultiple(of: 2) == nums[i].isMultiple(of: 2) {
                return false
            }
        }
        
        return true
    }
}
