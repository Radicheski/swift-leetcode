//
//  MaximumProductDifferenceBetweenTwoPairs.swift
//  https://leetcode.com/problems/maximum-product-difference-between-two-pairs/
//
//  Created by Erik Radicheski da Silva on 18/12/23.
//

import XCTest

final class MaximumProductDifferenceBetweenTwoPairs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProductDifference([5, 6, 2, 7, 4]), 34)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProductDifference([4, 2, 5, 9, 7, 4, 8]), 64)
    }

}

private class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        
        return (nums[n - 1] * nums[n - 2]) - (nums[1] * nums[0])
    }
}
