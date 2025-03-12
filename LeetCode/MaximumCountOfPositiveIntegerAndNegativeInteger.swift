//
//  MaximumCountOfPositiveIntegerAndNegativeInteger.swift
//  https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer/
//
//  Created by Erik Radicheski da Silva on 12/03/25.
//

import XCTest

final class MaximumCountOfPositiveIntegerAndNegativeInteger: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumCount([-2, -1, -1, 1, 2, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumCount([-3, -2, -1, 0, 0, 1, 2]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumCount([5, 20, 66, 1314]), 4)
    }
    
}

private class Solution {
    func maximumCount(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.endIndex - 1
        var index = nums.endIndex
        
        while left <= right {
            let middle = left + (right - left) / 2
            if nums[middle] >= 0 {
                right = middle - 1
                index = middle
            } else {
                left = middle + 1
            }
        }
            
        let negativeCount = index
        
        left = 0
        right = nums.endIndex - 1
        index = nums.endIndex
        
        while left <= right {
            let middle = left + (right - left) / 2
            if nums[middle] <= 0 {
                left = middle + 1
            } else {
                right = middle - 1
                index = middle
            }
        }
        
        let positiveCount = nums.count - index
        
        return max(negativeCount, positiveCount)
    }
}
