//
//  MaximumProductSubarray.swift
//  https://leetcode.com/problems/maximum-product-subarray/
//
//  Created by Erik Radicheski da Silva on 21/11/22.
//

import XCTest

final class MaximumProductSubarray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProduct([2, 3, -2, 4]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProduct([-2, 0, -1]), 0)
    }

}

private class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maximum = nums[0]
        var minimum = nums[0]
        
        var overallMaximum = maximum
        
        for index in 1 ..< nums.endIndex {
            let currentMaximum = max(nums[index], maximum * nums[index], minimum * nums[index])
            minimum = min(nums[index], maximum * nums[index], minimum * nums[index])
            
            maximum = currentMaximum
            
            overallMaximum = max(overallMaximum, maximum)
        }
        
        return overallMaximum
    }
}
