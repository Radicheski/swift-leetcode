//
//  MaximumProductOfTwoElementsInAnArray.swift
//  https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
//
//  Created by Erik Radicheski da Silva on 12/12/23.
//

import XCTest

final class MaximumProductOfTwoElementsInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProduct([3, 4, 5, 2]), 12)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProduct([1, 5, 4, 5]),  16)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxProduct([3, 7]), 12)
    }
    
}

private class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        return (nums[0] - 1) * (nums[1] - 1)
    }
}
