//
//  MonotonicArray.swift
//  https://leetcode.com/problems/monotonic-array/
//
//  Created by Erik Radicheski da Silva on 01/01/23.
//

import XCTest

final class MonotonicArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isMonotonic([1, 2, 2, 3]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.isMonotonic([6, 5, 4, 4]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.isMonotonic([1, 3, 2]))
    }

}

private class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var direction: Int?
        
        for index in 1 ..< nums.endIndex {
            if let dir = direction {
                if dir == 0 {
                    direction = nums[index] - nums[index - 1]
                } else {
                    if dir * (nums[index] - nums[index - 1]) < 0 {
                        return false
                    }
                }
            } else {
                direction = nums[index] - nums[index - 1]
            }
        }
        
        return true
    }
}
