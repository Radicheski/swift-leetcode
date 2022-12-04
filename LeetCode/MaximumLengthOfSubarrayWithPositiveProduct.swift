//
//  MaximumLengthOfSubarrayWithPositiveProduct.swift
//  https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/
//
//  Created by Erik Radicheski da Silva on 04/12/22.
//

import XCTest

final class MaximumLengthOfSubarrayWithPositiveProduct: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getMaxLen([1, -2, -3, 4]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getMaxLen([0, 1, -2, -3, -4]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getMaxLen([-1, -2, -3, 0, 1]), 2)
    }

}

private class Solution {
    func getMaxLen(_ nums: [Int]) -> Int {
        var arrayIndex = -1
        var negativeIndex = -1
        var negativeCount = 0
        
        var result = 0
            
        for (index, num) in nums.enumerated() {
            if num == 0 {
                arrayIndex = index
                negativeIndex = -1
                negativeCount = 0
            } else if num < 0 {
                if negativeIndex < 0 {
                    negativeIndex = index
                }
                
                negativeCount += 1
            }
            
            if negativeCount.isMultiple(of: 2) {
                result = max(result, index - arrayIndex)
            } else {
                result = max(result, index - negativeIndex)
            }
        }
        
        return result
    }
}
