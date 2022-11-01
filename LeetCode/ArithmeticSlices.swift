//
//  ArithmeticSlices.swift
//  https://leetcode.com/problems/arithmetic-slices/
//
//  Created by Erik Radicheski da Silva on 01/11/22.
//

import XCTest

final class ArithmeticSlices: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfArithmeticSlices([1, 2, 3, 4]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfArithmeticSlices([1]), 0)
    }
}

private class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        
        var count = 0
        var result = 0
        
        for i in 2 ..< nums.endIndex {
            if nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2] {
                count += 1
            } else {
                count = 0
            }
            
            result += count
        }
        
        return result
    }
}
